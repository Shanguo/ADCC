//
//  ADMeViewController.m
//  ADCC
//
//  Created by 刘山国 on 16/6/22.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADMeViewController.h"
#import "ADMeCollectionCell.h"
#import "ADMoreViewController.h"
#import "ADSettingController.h"
#import "ADDiscountController.h"
#import "ADOrderController.h"
#import "ADCollectionController.h"


typedef NS_ENUM(NSUInteger, ADMeControllers){
    AD0Order         = 0,
    AD1Discount,
    AD2Collection,
    AD3Attention,
    AD4Safe,
    AD5Helper,
    AD6Message,
    AD7Setting,
    AD8More
};

@interface ADMeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (nonatomic,strong) NSArray *imageNames;
@property (nonatomic,strong) NSArray *titles;

@end

@implementation ADMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";

    self.imageNames = @[@"0order",@"1discount",@"2collection",@"3attention",@"4safe",@"5helpercenter",@"6messagelist",@"7setting",@"8more"];
    self.titles = @[@"订单",@"优惠券",@"我的收藏",@"人物关注",@"用户安全",@"客服",@"消息列表",@"设置",@"更多"];
    [self.headImageView setCircleRadius:heightOf(self.headImageView)/2];
    [self collectionviewSetting];
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ADMeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kADMeCollectionCell forIndexPath:indexPath];
    [cell.label setText:self.titles[indexPath.row]];
    [cell.imageView setImage:[UIImage imageNamed:self.imageNames[indexPath.row]]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *viewController ;
    switch (indexPath.row) {
        case AD0Order:
            viewController = [[ADOrderController alloc] init];
            break;
        case AD1Discount:
            viewController = [[ADDiscountController alloc] init];
            break;
        case AD2Collection:
            viewController = [[ADCollectionController alloc] init];
            break;
        case AD3Attention:
            
            break;
        case AD4Safe:
            
            break;
        case AD5Helper:
            
            break;
        case AD6Message:
            
            break;
        case AD7Setting:
            viewController = [[ADSettingController alloc] init];
            break;
        case AD8More:
            viewController = [[ADMoreViewController alloc] init];
            
            break;
        default:
            break;
            
    }
    
    if (viewController) {
        [viewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}


- (void)collectionviewSetting{
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH-2)/3, (SCREEN_WIDTH-2)/3);
    [self.collectionView registerNib:[UINib nibWithNibName:@"ADMeCollectionCell" bundle:nil] forCellWithReuseIdentifier:kADMeCollectionCell];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

//
//  ADCollectionController.m
//  ADCC
//
//  Created by 刘山国 on 16/6/22.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADCollectionController.h"
#import "ADProductOrderCell.h"

@interface ADCollectionController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ADCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"我的收藏"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ADProductOrderCell" bundle:nil] forCellReuseIdentifier:kADProductOrderCell];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kADProductOrderCellH;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ADProductOrderCell *cell = (ADProductOrderCell*)[tableView dequeueReusableCellWithIdentifier:kADProductOrderCell forIndexPath:indexPath];
    [cell.priceLabel setHighlighted:YES];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

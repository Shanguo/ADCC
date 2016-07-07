//
//  ADBuyViewController.m
//  ADCC
//
//  Created by 刘山国 on 16/6/12.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADBuyViewController.h"
#import "ADProductOrderCell.h"

@interface ADBuyViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *noProductShowView;

@end

@implementation ADBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"购物袋";
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.noProductShowView];
    
}

#pragma mark - tableViewCell代理方法



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger x = 10;
    if (x>0) {
        [self.noProductShowView setHidden:YES];
    }else{
        [self.noProductShowView setHidden:NO];
    }
    return x;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kADProductOrderCellH;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ADProductOrderCell *cell = (ADProductOrderCell *)[tableView dequeueReusableCellWithIdentifier:kADProductOrderCell forIndexPath:indexPath];
    if (indexPath.row == 0) {
        [cell.lineView setHidden:YES];
    } else {
        [cell.lineView setHidden:NO];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        
    }
}

#pragma mark - getter

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TAB_BAR_HEIGHT)];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
//        [_tableView registerClass:[ADProductOrderCell class] forCellReuseIdentifier:kADProductOrderCell];
//        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView registerNib:[UINib nibWithNibName:@"ADProductOrderCell" bundle:nil] forCellReuseIdentifier:kADProductOrderCell];
    }
    return _tableView;
}

- (UIView *)noProductShowView{
    if (!_noProductShowView) {
        CGFloat wh = 200*XScale;
        CGFloat gap = 5*YScale;
        _noProductShowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, wh, wh)];
        [_noProductShowView setCenter:self.view.center];
        [_noProductShowView setBackgroundColor:[UIColor clearColor]];
        
        CALayer *imageLayer = [[CALayer alloc] init];
        CGFloat layerWh = 60*XScale;
        imageLayer.frame = CGRectMake((wh-layerWh)/2, gap, layerWh, layerWh);
        [imageLayer setContents:(__bridge id _Nullable)([UIImage imageNamed:@"buy_bigger"].CGImage)];
        [_noProductShowView.layer addSublayer:imageLayer];
        [imageLayer setBackgroundColor:[UIColor yellowColor].CGColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, maxYOf(imageLayer)+gap, wh, 40)];
        [label setText:@"购物袋空空如也\n来调几件好货吧！"];
        [label setLineBreakMode:NSLineBreakByCharWrapping];
        [label setNumberOfLines:2];
        [label setFont:[UIFont systemFontOfSize:16]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[UIColor greenColor]];
        [_noProductShowView addSubview:label];
    }
    return _noProductShowView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

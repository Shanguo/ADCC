//
//  ADDiscountController.m
//  ADCC
//
//  Created by 刘山国 on 16/6/22.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADDiscountController.h"

@interface ADDiscountController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ADDiscountController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"优惠券"];
}

#pragma mark - tableViewCell代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@""];
    

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

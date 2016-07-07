//
//  ADSettingController.m
//  ADCC
//
//  Created by 刘山国 on 16/6/22.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADSettingController.h"

@interface ADSettingController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;
@property (weak, nonatomic) IBOutlet UIView *footerView;

@end

@implementation ADSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"设置"];
    [self.logoutBtn setCircleRadius:10];
    [self.footerView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, heightOf(self.footerView)+(SCREEN_HEIGHT-60*3-8-50*3-8-60-NAVIGATION_BAR_HEIGHT-STATUS_BAR_HEIGHT))];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==1) return 0;
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) return 60;
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    UIView *view = [cell.contentView viewWithTag:1000];
    if (view) [view removeFromSuperview];
    
    if (indexPath.section==0) {
        [cell.textLabel setTextColor:[UIColor darkGrayColor]];
        if (indexPath.row==0) {
            cell.textLabel.text = @"头像";
            UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-18-50, 5, 50, 50)];
            [headImageView setImage:[UIImage imageNamed:@"detailhead"]];
            headImageView.tag = 1000;
            [cell.contentView addSubview:headImageView];
        }else if(indexPath.row==1){
            cell.textLabel.text = @"昵称";
            cell.detailTextLabel.text = @"哈哈";
        }else if(indexPath.row ==2){
            cell.textLabel.text = @"个人介绍";
        }
    } else {
        if (indexPath.row==0) {
            [cell.textLabel setText:@"清楚缓存"];
            [cell.detailTextLabel setText:@"58.8M"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if(indexPath.row==1){
            [cell.textLabel setText:@"清空消息记录"];
        }else if(indexPath.row ==2){
            [cell.textLabel setText:@"更换地址"];
        }
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}



- (IBAction)logoutClick:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

//
//  ADTopicDetailController.m
//  ADCC
//
//  Created by 刘山国 on 16/6/17.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADTopicDetailController.h"
//#import "UINavigationItem+SG.h"
#import "SGHImageButton.h"

@interface ADTopicDetailController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *topicImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *descTextView;
@property (weak, nonatomic) IBOutlet UIButton *collectBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@end

@implementation ADTopicDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"夏日"];
}

- (void)popOut{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

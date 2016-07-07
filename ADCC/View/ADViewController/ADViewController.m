//
//  ADViewController.m
//  ADCC
//
//  Created by 刘山国 on 16/6/20.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADViewController.h"

@interface ADViewController ()

@end

@implementation ADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *backButtonImage = [[UIImage imageNamed:@"back_arrow"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //    if (self.childViewControllers.count > 0) {
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
//    UIBarButtonItem *leftSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    leftSpacer.width = -15;
//    viewController.navigationItem.leftBarButtonItems = @[leftSpacer,backItem];
    //    }
//    [super pushViewController:viewController animated:animated];
//}


- (void)backClick:(UIButton*)btn{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(-10, 0, 21, 21)];
        [_backBtn backgroundImage:[UIImage imageNamed:@"back_arrow"]];
        [_backBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_backBtn addTarget:self Listener:@selector(backClick:)];
    }
    return _backBtn;
}


@end

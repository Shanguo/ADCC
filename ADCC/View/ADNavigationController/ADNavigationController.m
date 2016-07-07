//
//  ADNavigationController.m
//  ADCC
//
//  Created by 刘山国 on 16/6/20.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADNavigationController.h"

@interface ADNavigationController ()

@end

@implementation ADNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 重写push方法，在此设置被push的viewcontroller的返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [self settingBackBtnStyle];
    [self settingleftBarButtonStyleWithViewController:viewController];
//    [self settingBackBarButtonItemStyleWithController:viewController];
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 修改基本样式
- (void)settingBackBtnStyle{
    [self.navigationBar setTintColor:[UIColor blackColor]];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Thin" size:18.0]}];
}

#pragma mark - 修改返回按钮样式
- (void)settingBackBarButtonItemStyleWithController:(UIViewController*)viewController{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    viewController.navigationItem.backBarButtonItem =backItem;
    //将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];

}


#pragma mark - 自定义返回按钮样式
- (void)settingleftBarButtonStyleWithViewController:(UIViewController*)viewController{
    
    if (self.childViewControllers.count > 0) {//确保最上层Navigation不加返回按钮
        UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 21, 21)];
        [backBtn backgroundImage:[UIImage imageNamed:@"back_arrow"]];//这里只设置箭头，不是文字，所以用backgroundImage
        [backBtn addTarget:self Listener:@selector(popOut)];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        UIBarButtonItem *leftSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        leftSpacer.width = -12;
        viewController.navigationItem.leftBarButtonItems = @[leftSpacer,backItem];
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.interactivePopGestureRecognizer.delegate = nil;
        }
    }
}

#pragma mark - PopOut
- (void)popOut{
    [self popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

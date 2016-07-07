//
//  ADPinViewController.m
//  ADCC
//
//  Created by 刘山国 on 16/6/12.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADPinViewController.h"

@interface ADPinViewController ()

@end

@implementation ADPinViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

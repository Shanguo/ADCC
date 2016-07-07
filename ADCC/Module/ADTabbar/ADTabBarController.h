//
//  ADTabbarController.h
//  ADCC
//
//  Created by 刘山国 on 16/6/12.
//  Copyright © 2016年 山国. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADFanViewController.h"
#import "ADPinViewController.h"
#import "ADBuyViewController.h"
#import "ADMeViewController.h"

@interface ADTabBarController : UITabBarController

@property (nonatomic,strong) ADFanViewController *fanController;
@property (nonatomic,strong) ADPinViewController *pinController;
@property (nonatomic,strong) ADBuyViewController *buyController;
@property (nonatomic,strong) ADMeViewController  *meController;

@end

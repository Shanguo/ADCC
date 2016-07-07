//
//  ADTabBarController.m
//  ADCC
//
//  Created by 刘山国 on 16/6/12.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADTabBarController.h"
#import "ADNavigationController.h"

static CGFloat const kFontSize = 15.0f;

@interface ADTabBarController ()

@property (nonatomic,strong) NSArray *allViewControlers;
@property (nonatomic,strong) NSArray *allNavControllers;
@property (nonatomic,strong) NSArray *tabbarNames;
@property (nonatomic,strong) NSArray *tabbarSelectedImageNames;
@property (nonatomic,strong) NSArray *tabbarUnselectedImageNames;

@end

@implementation ADTabBarController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataInit];
    
    [self.tabBar setBarTintColor:RGBA(0, 0, 0, 0.8)];
    self.viewControllers = self.allNavControllers;
    [self setUpBarItems];
    
}


- (void)dataInit{
    self.tabbarNames                = @[@"范",@"品",@"购",@"我"];
    self.tabbarSelectedImageNames   = @[@"fan_selected",@"pin_selected",@"buy_selected",@"me_selected"];
    self.tabbarUnselectedImageNames = @[@"fan",@"pin",@"buy",@"me"];
}


-(NSArray *)allViewControlers{
    if (!_allViewControlers) {
        self.fanController = [[ADFanViewController alloc] init];
        self.pinController = [[ADPinViewController alloc] init];
        self.buyController = [[ADBuyViewController alloc] init];
        self.meController  = [[ADMeViewController alloc] init];
        
        _allViewControlers = @[self.fanController,self.pinController,self.buyController,self.meController];
        
    }
    return _allViewControlers;
}

- (NSArray *)allNavControllers{
    if (!_allNavControllers) {
        [self allViewControlers];
        ADNavigationController *fan = [[ADNavigationController alloc]initWithRootViewController:self.fanController];
        ADNavigationController *pin = [[ADNavigationController alloc]initWithRootViewController:self.pinController];
        ADNavigationController *buy = [[ADNavigationController alloc]initWithRootViewController:self.buyController];
        ADNavigationController *me  = [[ADNavigationController alloc]initWithRootViewController:self.meController];
        _allNavControllers = @[fan,pin,buy,me];

    }
    return _allNavControllers;
}

- (void)setUpBarItems{
    
    for (NSInteger i = 0; i<self.allViewControlers.count; i++) {
        UIViewController *viewController = self.allViewControlers[i];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:self.tabbarNames[i] image:[self imageWithName:self.tabbarUnselectedImageNames[i]] selectedImage:[self imageWithName:self.tabbarSelectedImageNames[i]]];
        [self selectedTapTabBarItems:tabBarItem];
        [self unSelectedTapTabBarItems:tabBarItem];
        tabBarItem.tag = i;

        viewController.tabBarItem = tabBarItem;
    }
}



- (UIImage *)imageWithName:(NSString*)imageName{
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}



-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:kFontSize],NSFontAttributeName,COLOR_MAIN,NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateNormal];
}

-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:kFontSize],
                                        NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

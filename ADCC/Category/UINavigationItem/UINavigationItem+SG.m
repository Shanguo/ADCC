//
//  UINavigationItem+SG.m
//  ADCC
//
//  Created by 刘山国 on 16/6/20.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "UINavigationItem+SG.h"
#import <objc/runtime.h>

@implementation UINavigationItem (SG)

//-(UIBarButtonItem *)backBarButtonItem{
////    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 21, 21)];
////    [backBtn color:[UIColor yellowColor]];
////    [backBtn backgroundImage:[UIImage imageNamed:@"back_arrow"]];
////    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
////    return backItem;
////    return [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:NULL];
////    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_arrow"] style:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    [imageView setImage:[UIImage imageNamed:@"back_arrow"]];
//    return [[UIBarButtonItem alloc] initWithCustomView:imageView];
//}

- (UIBarButtonItem *)leftBarButtonItem{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [imageView setImage:[UIImage imageNamed:@"back_arrow"]];
        return [[UIBarButtonItem alloc] initWithCustomView:imageView];
}

//+(void)load{
//    
//    static dispatch_once_t onceToken;
//    
//    dispatch_once(&onceToken, ^{
//        
//        Method originalMethodImp = class_getInstanceMethod(self, @selector(backBarButtonItem));
//        
//        Method destMethodImp = class_getInstanceMethod(self, @selector(myCustomBackButton_backBarbuttonItem));
//        
//        method_exchangeImplementations(originalMethodImp, destMethodImp);
//        
//    });
//    
//}
//
//static char kCustomBackButtonKey;
//
//-(UIBarButtonItem *)myCustomBackButton_backBarbuttonItem{
//    
//    UIBarButtonItem *item = [self myCustomBackButton_backBarbuttonItem];
//    
//    if (item) {
//        
//        return item;
//        
//    }
//    
//    item = objc_getAssociatedObject(self, &kCustomBackButtonKey);
//    
//    if (!item) {
//        
////        item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:NULL];
//        
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//        [imageView setImage:[UIImage imageNamed:@"back_arrow"]];
//        item = [[UIBarButtonItem alloc] initWithCustomView:imageView];
//        objc_setAssociatedObject(self, &kCustomBackButtonKey, item, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        
//    }
//    
//    return item;
//    
//}
//
//- (void)dealloc {
//    
//    objc_removeAssociatedObjects(self);
//    
//}

@end

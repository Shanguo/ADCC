//
//  UIView+SG.m
//  Toing
//
//  Created by Rdd7 on 7/5/15.
//  Copyright (c) 2015 bibibi. All rights reserved.
//

#import "UIView+SG.h"

@implementation UIView(SG)

-(void)setCircleRadius:(CGFloat)radius{
    self.layer.cornerRadius=radius;
    [self.layer setMasksToBounds:YES];
}

- (void)setBorderWidth:(CGFloat)width Color:(UIColor*)color{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

CGFloat widthOf(id view){
    return CGRectGetWidth(((UIView*)view).frame);
}

CGFloat heightOf(id view){
    return CGRectGetHeight(((UIView*)view).frame);
}

CGFloat minXOf(id view){
    return CGRectGetMinX(((UIView*)view).frame);
}

CGFloat midXOf(id view){
    return CGRectGetMidX(((UIView*)view).frame);
}

CGFloat maxXOf(id view){
    return CGRectGetMaxX(((UIView*)view).frame);
}

CGFloat minYOf(id view){
    return CGRectGetMinY(((UIView*)view).frame);
}

CGFloat midYOf(id view){
    return CGRectGetMidY(((UIView*)view).frame);
}

CGFloat maxYOf(id view){
    return CGRectGetMaxY(((UIView*)view).frame);
}

@end

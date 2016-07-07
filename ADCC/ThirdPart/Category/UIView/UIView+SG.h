//
//  UIView+SG.h
//  Toing
//
//  Created by Rdd7 on 7/5/15.
//  Copyright (c) 2015 bibibi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(SG)

/**
 *  设置View的圆角
 *
 *  @param radius 圆角半径
 */
- (void)setCircleRadius:(CGFloat)radius;

- (void)setBorderWidth:(CGFloat)width Color:(UIColor*)color;

/**
 *  快捷方法，获取view的x,y,width,height等
 *
 *  return CGFloat
 */
CGFloat widthOf(id view);

CGFloat heightOf(id view);

CGFloat minXOf(id view);

CGFloat midXOf(id view);

CGFloat maxXOf(id view);

CGFloat minYOf(id view);

CGFloat midYOf(id view);

CGFloat maxYOf(id view);
@end

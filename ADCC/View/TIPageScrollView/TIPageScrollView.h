//
//  TIPageScrollView.h
//  Toing
//
//  Created by Rdd7 on 7/5/15.
//  Copyright (c) 2015 bibibi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TIPageScrollView;
@protocol TIPageScrollViewDelegate <NSObject>

- (void)tiPageScrollView:(TIPageScrollView*)pageScrollView didSelectedAtIndex:(NSUInteger)index;

@end

@protocol TIPageScrollViewDataSource <NSObject>

- (NSURL*)tiImageUrlAtIndex:(NSUInteger)index;
- (NSInteger)tiNumberOfImages;

@end



@interface TIPageScrollView : UIView<UIScrollViewDelegate>

@property   (nonatomic,weak)    id<TIPageScrollViewDelegate>    delegate;
@property   (nonatomic,weak)    id<TIPageScrollViewDataSource>  dataSource;

@property   (nonatomic,strong)  UIPageControl   *pageCtrl;

-(instancetype)initWithFrame:(CGRect)frame;

/**
 *  重载视图中的图片
 */
-(void)reloadViews;


@end

//
//  ADSearchProductCell.m
//  ADCC
//
//  Created by 刘山国 on 16/6/13.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADSearchProductCell.h"

#define kImageViewH (100.0*YScale)
#define kGap (8*YScale)
#define kTitleH (20*YScale)
#define kDetailH (30*YScale)
#define kDetailW (70*XScale)

@interface ADSearchProductCell()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *detailLabel;
@property (nonatomic,strong) UIView *descView;

@end

@implementation ADSearchProductCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.descView];
        [self.descView addSubview:self.titleLabel];
        [self.descView addSubview:self.detailLabel];
        [self bringSubviewToFront:self.imageView];
    }
    return self;
}


- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, widthOf(self), kImageViewH)];
        [_imageView setImage:[UIImage imageNamed:@"7.jpg"]];
    }
    return _imageView;
}

- (UIView *)descView{
    if (!_descView) {
        _descView = [[UIView alloc]initWithFrame:CGRectMake(0, maxYOf(self.imageView)-1, widthOf(self), heightOf(self)-heightOf(self.imageView)+1)];
        [_descView setBorderWidth:0.5 Color:[UIColor lightGrayColor]];
    }
    return _descView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(kGap, kGap, widthOf(self)-kGap*2, kTitleH)];
        [_titleLabel setText:@"床垫木屋"];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [_titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake((widthOf(self.descView)-kDetailW)/2, maxYOf(self.titleLabel)+kGap, kDetailW, kDetailH)];
        [_detailLabel setText:@"清爽·床垫木屋室内设计"];
        [_detailLabel setTextColor:[UIColor lightGrayColor]];
        [_detailLabel setFont:[UIFont systemFontOfSize:8]];
        [_detailLabel setTextAlignment:NSTextAlignmentCenter];
        [_detailLabel setLineBreakMode:NSLineBreakByCharWrapping];
        [_detailLabel setNumberOfLines:2];
    }
    return _detailLabel;
}



@end

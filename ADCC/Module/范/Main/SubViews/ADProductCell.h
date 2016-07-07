//
//  ADProductCell.h
//  ADCC
//
//  Created by 刘山国 on 16/6/14.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADTableViewCell.h"

static NSString * const kADProductCell = @"ADProductCell";
static CGFloat const kGap = 8;
#define kADProductCellH ((214+kGap)*YScale)

@interface ADProductCell : ADTableViewCell

@property (nonatomic,strong) UIImageView *backImageView;
@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *countLabel;
@property (nonatomic,strong) UIView *starsView;
@property (nonatomic,strong) CALayer *locationTagLayer;
@property (nonatomic,strong) UILabel *locationLabel;
@property (nonatomic,strong) UIView *locationView;

@end

//
//  ADCCShowsCell.h
//  ADCC
//
//  Created by 刘山国 on 16/6/14.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADTableViewCell.h"

static NSString * const kADCCShowsCell = @"ADCCShowsCell";
#define kADCCShowsCellH (128*YScale)

@interface ADCCShowsCell : ADTableViewCell

@property (nonatomic,strong) UIImageView *showImageView;

- (void)setImageWithUrl:(NSURL*)url;

@end

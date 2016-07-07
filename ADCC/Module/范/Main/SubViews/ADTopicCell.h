//
//  ADTopicCell.h
//  ADCC
//
//  Created by 刘山国 on 16/6/14.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADTableViewCell.h"

static NSString * const  kADTopicCell = @"kADTopicCell";
#define kADTopicCellH (192*YScale)

@interface ADTopicCell : ADTableViewCell

@property (nonatomic,strong) UIImageView *topicImageView;

- (void)setImageWithUrl:(NSURL*)url;

@end

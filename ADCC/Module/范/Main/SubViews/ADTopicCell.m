//
//  ADTopicCell.m
//  ADCC
//
//  Created by 刘山国 on 16/6/14.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADTopicCell.h"

@implementation ADTopicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.topicImageView];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (UIImageView *)topicImageView{
    if (!_topicImageView) {
        _topicImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, widthOf(self), kADTopicCellH)];
        _topicImageView.alpha = 0.6;
    }
    return _topicImageView;
}

- (void)setImageWithUrl:(NSURL*)url{
    [self.topicImageView sd_setImageWithURL:url];
}


@end

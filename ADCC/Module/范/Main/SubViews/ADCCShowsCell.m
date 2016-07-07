//
//  ADCCShowsCell.m
//  ADCC
//
//  Created by 刘山国 on 16/6/14.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADCCShowsCell.h"

@implementation ADCCShowsCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.showImageView];
    }
    return self;
}
//- (void)setFrame:(CGRect)frame
//{
//    frame.size.width = SCREEN_WIDTH;
//    [super setFrame:frame];
//    
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (UIImageView *)showImageView{
    if (!_showImageView) {
        _showImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, widthOf(self), kADCCShowsCellH)];
    }
    return _showImageView;
}

- (void)setImageWithUrl:(NSURL*)url{
    [self.showImageView sd_setImageWithURL:url];
}

@end

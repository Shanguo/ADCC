//
//  ADTableViewCell.m
//  ADCC
//
//  Created by 刘山国 on 16/6/15.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADTableViewCell.h"

@implementation ADTableViewCell

- (void)setFrame:(CGRect)frame{
    frame.size.width = SCREEN_WIDTH;
    [super setFrame:frame];
}


@end

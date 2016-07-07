//
//  SGHImageButton.m
//  ADCC
//
//  Created by 刘山国 on 16/6/21.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "SGHImageButton.h"

@implementation SGHImageButton
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, heightOf(self), heightOf(self));
    self.titleLabel.frame = CGRectMake(maxXOf(self.imageView), 0, widthOf(self)-maxXOf(self.imageView), heightOf(self));
}
@end

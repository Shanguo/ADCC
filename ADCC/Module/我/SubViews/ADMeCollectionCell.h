//
//  ADMeCollectionCell.h
//  ADCC
//
//  Created by 刘山国 on 16/6/22.
//  Copyright © 2016年 山国. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const kADMeCollectionCell = @"kADMeCollectionCell";

@interface ADMeCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

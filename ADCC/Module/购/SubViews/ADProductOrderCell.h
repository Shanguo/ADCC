//
//  ADProductOrderCell.h
//  ADCC
//
//  Created by 刘山国 on 16/6/17.
//  Copyright © 2016年 山国. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const kADProductOrderCell = @"ADProductOrderCell";
static CGFloat const kADProductOrderCellH = 110;


@interface ADProductOrderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *material;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

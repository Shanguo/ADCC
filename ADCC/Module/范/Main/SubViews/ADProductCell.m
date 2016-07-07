//
//  ADProductCell.m
//  ADCC
//
//  Created by 刘山国 on 16/6/14.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADProductCell.h"

#define kImageViewH (164*YScale)
#define kLocationViewH (50*YScale)


@implementation ADProductCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addViews];
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

- (void)setImageWithUrl:(NSURL*)url{
    [self.backImageView sd_setImageWithURL:url];
}

- (void)addViews{
    [self addSubview:self.backImageView];
    [self.backImageView addSubview:self.backView];
    [self.backView addSubview:self.headImageView];
    [self.backView addSubview:self.nameLabel];
    [self.backView addSubview:self.starsView];
    [self.backView addSubview:self.countLabel];
//    [self.layer addSublayer:self.locationTagLayer];
//    [self addSubview:self.locationLabel];
    [self addSubview:self.locationView];
    [self.locationView.layer addSublayer:self.locationTagLayer];
    [self.locationView addSubview:self.locationLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, widthOf(self), kImageViewH)];
    }
    return _backImageView;
}



- (UIImageView *)headImageView{
    if (!_headImageView) {
        CGFloat d = 76*XScale;
        _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, d, d)];
        [_headImageView setCircleRadius:d/2];
    }
    return _headImageView;
}
- (UIView *)backView{
    if (!_backView) {
        CGFloat d= 76*XScale;
        CGFloat x = 69*XScale;
        _backView = [[UIView alloc]initWithFrame:CGRectMake(x, (kImageViewH-d)/2,widthOf(self)-x*2 , d)];
    }
    return _backView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(maxXOf(self.headImageView)+kGap*XScale+5, kGap*YScale, widthOf(self.backView)-maxXOf(self.headImageView)-kGap*XScale, 21*YScale)];
        [_nameLabel setText:@"果果果果果"];
        [_nameLabel setTextColor:[UIColor whiteColor]];
    }
    return _nameLabel;
}

- (UIView *)starsView{
    if (!_starsView) {
        CGFloat d = 15;
        _starsView = [[UIView alloc]initWithFrame:CGRectMake(minXOf(self.nameLabel), heightOf(self.backView)-d*XScale-kGap*YScale-5, (d+kGap)*XScale*5, d)];
        for (NSInteger i =0 ; i<5; i++) {
            CALayer *layer = [[CALayer alloc] init];
            layer.frame = CGRectMake(i*(kGap+d)*XScale, 0, d, d);
            layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"star"].CGImage);
            [_starsView.layer addSublayer:layer];
        }
    }
    return _starsView;
}

- (UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(maxXOf(self.starsView), minYOf(self.starsView)+1, widthOf(self.backView)-widthOf(self.imageView)-kGap*XScale-widthOf(self.starsView), heightOf(self.starsView))];
        [_countLabel setText:@"1808"];
        [_countLabel setTextColor:[UIColor whiteColor]];
        [_countLabel setFont:[UIFont systemFontOfSize:13]];
    }
    return _countLabel;
}

- (CALayer *)locationTagLayer{
    if (!_locationTagLayer) {
        CGFloat d = 24*YScale;
        _locationTagLayer = [[CALayer alloc]init];
        _locationTagLayer.frame = CGRectMake(kGap*XScale, (kLocationViewH-d)/2, d, d);
        _locationTagLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"location"].CGImage);
    }
    return _locationTagLayer;
}

- (UILabel *)locationLabel{
    if (!_locationLabel) {
        _locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(maxXOf(self.locationTagLayer)+kGap*XScale, 0, widthOf(self)-maxXOf(self.locationTagLayer)-kGap, kLocationViewH)];
        [_locationLabel setText:@"杭州西湖区华星路96号火炬咖啡"];
        [_locationLabel setTextColor:[UIColor lightGrayColor]];
        [_locationLabel setFont:[UIFont systemFontOfSize:14]];
    }
    return _locationLabel;
}

- (UIView *)locationView{
    if (!_locationView) {
        _locationView = [[UIView alloc]initWithFrame:CGRectMake(0, maxYOf(self.backImageView), widthOf(self), kLocationViewH)];
        [_locationView setBackgroundColor:[UIColor whiteColor]];
    }
    return _locationView;
}



@end

//
//  ADSearchsView.m
//  ADCC
//
//  Created by 刘山国 on 16/6/13.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADSearchsView.h"
#import "ADSearchProductCell.h"

#define kWidth 1242.0
#define kLittleLineH (SCREEN_WIDTH*(46.0/kWidth))
#define kTittleH (SCREEN_WIDTH*(90.0/kWidth))

@interface ADSearchsView()

@property (nonatomic,strong) CALayer *littleLineLayer;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) CALayer *lineLayer;

@end

@implementation ADSearchsView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer addSublayer:self.littleLineLayer];
        [self addSubview:self.titleLabel];
        [self.layer addSublayer:self.lineLayer];
        [self addSubview:self.collectionView];
    }
    return self;
}


#pragma mark - getter

- (CALayer *)littleLineLayer{
    if (!_littleLineLayer) {
        _littleLineLayer = [[CALayer alloc]init];
        [_littleLineLayer setFrame:CGRectMake(0, (kTittleH-kLittleLineH)/2, 1.5, kLittleLineH)];
        [_littleLineLayer setBackgroundColor:[UIColor orangeColor].CGColor];
    }
    return _littleLineLayer;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, widthOf(self), kTittleH)];
        [_titleLabel setText:@"热门搜索"];
//        [_titleLabel setFont:[UIFont fontWithName:FontHelveticalNeue_B size:16]];
        [_titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_titleLabel setTextColor:[UIColor blackColor]];
    }
    return _titleLabel;
}

- (CALayer *)lineLayer{
    if (!_lineLayer) {
        _lineLayer = [[CALayer alloc]init];
        [_lineLayer setFrame:CGRectMake(0, maxYOf(self.titleLabel), widthOf(self), 0.5)];
        [_lineLayer setBackgroundColor:[UIColor groupTableViewBackgroundColor].CGColor];
    }
    return _lineLayer;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        CGRect frame = CGRectMake(0, maxYOf(self.lineLayer), widthOf(self), heightOf(self)-maxYOf(self.lineLayer));
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(400.0/3*XScale, 500/3*YScale);
        flowLayout.minimumLineSpacing = 100.0/3*XScale;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, flowLayout.minimumLineSpacing, 0, flowLayout.minimumLineSpacing);
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:flowLayout];
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        [_collectionView registerClass:[ADSearchProductCell class] forCellWithReuseIdentifier:kADSearchProductCell];
        [_collectionView setShowsHorizontalScrollIndicator:NO];
    }
    return _collectionView;
}



@end

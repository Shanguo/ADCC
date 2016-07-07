//
//  TIPageScrollView.m
//  Toing
//
//  Created by Rdd7 on 7/5/15.
//  Copyright (c) 2015 bibibi. All rights reserved.
//

#import "TIPageScrollView.h"


const CGFloat pageCtrlMarginBottom=10.0;
const CGFloat pageCtrlHeight=15.0;


@interface TIPageScrollView ()

@property   (nonatomic,strong)  NSMutableArray  *imageViews;
@property   (nonatomic,strong)  UIScrollView    *scrollView;
@property   (nonatomic,assign)  NSInteger       curIndex;
@property   (nonatomic,strong)  NSTimer         *timer;
@property   (nonatomic,strong)  UIView          *pageIndexView;
@property   (nonatomic,strong)  UILabel         *nowIndexLabel;
@property   (nonatomic,strong)  CALayer         *tagLayer;
@property   (nonatomic,strong)  UILabel         *totalLabel;
@end

@implementation TIPageScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        _imageViews=[[NSMutableArray alloc]initWithCapacity:0];
//        DLog(@"%@",NSStringFromCGRect(self.bounds));
        self.scrollView=[[UIScrollView alloc]initWithFrame:self.bounds];
        self.scrollView.delegate=self;
        self.scrollView.pagingEnabled=YES;
        self.scrollView.showsHorizontalScrollIndicator=NO;
        self.scrollView.showsVerticalScrollIndicator=NO;
        self.scrollView.bounces = NO;
        [self addSubview:self.scrollView];
        
        self.pageCtrl=[[UIPageControl alloc]init];
        self.pageCtrl.currentPageIndicatorTintColor=COLOR_MAIN;
        self.pageCtrl.frame=CGRectMake(0, CGRectGetMaxY(self.bounds)-pageCtrlMarginBottom-pageCtrlHeight, SCREEN_WIDTH, pageCtrlHeight);
//        [self addSubview:self.pageCtrl];
        [self.pageCtrl addTarget:self action:@selector(pageDidChanged) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:self.pageIndexView];
        self.curIndex=-1;
    }
    return self;
}


-(void)reloadViews{
    [self stopTimer];
    [self setNewContentSize];
    [self reloadImages];
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    [self resizePageCtrl];
    [self startTimer];
}


-(void)setNewContentSize{
    NSInteger imageNumber=0;
    if([self.dataSource respondsToSelector:@selector(tiNumberOfImages)]){
        imageNumber=[self.dataSource tiNumberOfImages];
    }
    [self.scrollView setContentSize:CGSizeMake(imageNumber*self.bounds.size.width, self.bounds.size.height)];
}


-(void)reloadImages{
    NSInteger imageNumber=0;
    if([self.dataSource respondsToSelector:@selector(tiNumberOfImages)]){
        imageNumber=[self.dataSource tiNumberOfImages];
        [self.totalLabel setText:[NSString stringWithFormat:@"%ld",(long)imageNumber]];
    }
    
    [self resizeImageViewsAndAddTapGestureWithMaxNumber:imageNumber];//根据现在所需的图片个数动态增加或者销毁多余的ImageView,使个数与要求显示的吻合，并显示到scrollView上，同时添加点击手势
    
    for(NSInteger itr=0;itr<imageNumber;++itr){
        UIImageView *imageV=self.imageViews[itr];
        NSURL *url=[self.dataSource tiImageUrlAtIndex:itr];
        [imageV sd_setImageWithURL:url placeholderImage:nil];
    }
}


-(void)resizeImageViewsAndAddTapGestureWithMaxNumber:(NSInteger)maxNumber{
    
    if(self.imageViews.count<maxNumber){
        for(NSInteger itr=self.imageViews.count;itr<maxNumber;++itr){
            
            UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(itr*SCREEN_WIDTH, 0, self.bounds.size.width, self.bounds.size.height)];
            imageV.tag=itr;
            
            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewDidTouched:)];
            [imageV setUserInteractionEnabled:YES];
            [imageV addGestureRecognizer:tap];
            
            [self.scrollView addSubview:imageV];
            [self.imageViews addObject:imageV];
            
        }
    }
    else if(self.imageViews.count>maxNumber){
        for(NSInteger itr=self.imageViews.count-1;itr<=maxNumber;--itr){
            
            UIImageView *imageV=self.imageViews[itr];
            [imageV removeFromSuperview];
            [self.imageViews removeObject:imageV];
            
        }
    }
    
}


-(void)resizePageCtrl{
    self.pageCtrl.numberOfPages=self.imageViews.count;
    self.curIndex=0;
}



#pragma mark methods
-(void)imageViewDidTouched:(UITapGestureRecognizer*)gesture{
    if([self.delegate respondsToSelector:@selector(tiPageScrollView:didSelectedAtIndex:)]){
        [self.delegate tiPageScrollView:self didSelectedAtIndex:gesture.view.tag];
    }
}


-(void)pageDidChanged{
    NSInteger pageIndex=self.pageCtrl.currentPage;
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH*pageIndex, 0) animated:YES];
    
}

#pragma mark Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self startTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger pageNumber=(scrollView.contentOffset.x-(SCREEN_WIDTH/2))/SCREEN_WIDTH+1;
    if(self.curIndex!=pageNumber){
        //        DLog(@"pageNumber:%li",(long)pageNumber);
        self.curIndex=pageNumber;
        [self.pageCtrl setCurrentPage:self.curIndex];
        [self.nowIndexLabel setText:[NSString stringWithFormat:@"%ld",self.curIndex+1]];
    }
}

- (void)startTimer{
    if(self.imageViews.count>=2){
        self.timer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(rollPage) userInfo:nil repeats:YES];
    }
}

- (void)stopTimer{
    [self.timer invalidate];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self stopTimer];
}


-(void)rollPage{
    if(self.imageViews.count>=2){
        self.curIndex=(self.curIndex+1)%self.imageViews.count;
        [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.bounds)*self.curIndex, 0) animated:YES];
        [self.pageCtrl setCurrentPage:self.curIndex];
        [self.nowIndexLabel setText:[NSString stringWithFormat:@"%ld",self.curIndex+1]];
    }
    else{
        [self stopTimer];
    }
}

- (UIView *)pageIndexView{
    if (!_pageIndexView) {
        CGFloat height = 35*3*YScale;
        _pageIndexView = [[UIView alloc]initWithFrame:CGRectMake(12*XScale, heightOf(self)-height-16*YScale, 35*XScale, height)];
        _pageIndexView.backgroundColor = RGBA(240, 240, 240, 0.5);
        
        self.nowIndexLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, height/3, height/3)];
        [self.nowIndexLabel setText:@"1"];
        [self.nowIndexLabel setFont:[UIFont fontWithName:FontHelveticalNeue_B size:23]];
        [self.nowIndexLabel setTextAlignment:NSTextAlignmentCenter];
        [self.nowIndexLabel setTextColor:[UIColor blackColor]];
        [_pageIndexView addSubview:self.nowIndexLabel];
        
        CGFloat gap = 5.5*((XScale+YScale)/2);
        self.tagLayer = [[CALayer alloc] init];
        self.tagLayer.frame = CGRectMake(minXOf(self.nowIndexLabel)+gap, heightOf(self.nowIndexLabel)+gap, widthOf(self.nowIndexLabel)-gap*2, heightOf(self.nowIndexLabel)-gap*2);
        self.tagLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"taglogo"].CGImage);
        [_pageIndexView.layer addSublayer:self.tagLayer];
        
        self.totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(minXOf(self.nowIndexLabel), maxYOf(self.tagLayer)+gap, widthOf(self.nowIndexLabel), heightOf(self.nowIndexLabel))];
        [self.totalLabel setText:@"0"];
        [self.totalLabel setTextColor:[UIColor blackColor]];
        [self.totalLabel setFont:[UIFont fontWithName:FontHelveticalNeue_B size:23]];
        [self.totalLabel setTextAlignment:NSTextAlignmentCenter];
        [_pageIndexView addSubview:self.totalLabel];
    }
    return _pageIndexView;
}


#pragma mark DataSource
-(void)setDataSource:(id<TIPageScrollViewDataSource>)dataSource{
    if(dataSource!=_dataSource){
        _dataSource=dataSource;
    }
    [self reloadViews];
}

@end

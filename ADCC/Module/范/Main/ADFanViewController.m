//
//  ADFanViewController.m
//  ADCC
//
//  Created by 刘山国 on 16/6/12.
//  Copyright © 2016年 山国. All rights reserved.
//

#import "ADFanViewController.h"
#import "TIPageScrollView.h"
#import "ADSearchsView.h"
#import "ADSearchProductCell.h"
#import "ADTopicCell.h"
#import "ADProductCell.h"
#import "ADCCShowsCell.h"
#import "ADTopicDetailController.h"
#import "ADProductDetailController.h"

#define kWidth 1242.0
#define kPageScrollViewH (SCREEN_WIDTH*(1703.0/kWidth))
#define kUDGap (SCREEN_WIDTH*(30.0/kWidth))
#define kImageViewH (SCREEN_WIDTH*(1068.0/kWidth))
#define kSearchViewH (SCREEN_WIDTH*(775.0/kWidth))
#define kPersonViewH (SCREEN_WIDTH*(1553.0/kWidth))

static NSInteger const kBaseTag = 100;

typedef NS_ENUM(NSUInteger, ADCCPage){
    
    ADFirstPage         = 0,
    ADTopicPage         = 1,
    ADProductPage       = 2,
    ADCCShowPage        = 3
};

@interface ADFanViewController ()<TIPageScrollViewDataSource,TIPageScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIScrollView *backScrollView;
@property (nonatomic,strong) UIScrollView *scrollView;//首页
@property (nonatomic,strong) UIView *titlesView;//四个标题
@property (nonatomic,assign) NSInteger selectedIndex;//标题选中tag
@property (nonatomic,strong) TIPageScrollView *pageScrollView;//最上轮播
@property (nonatomic,strong) UITableView *topicTableView;
@property (nonatomic,strong) UITableView *productTableView;
@property (nonatomic,strong) UITableView *adccTableView;
//@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIImageView *imageView;//
@property (nonatomic,strong) ADSearchsView *searchView;//最近搜索
@property (nonatomic,strong) UIView *personView;//人物专题
@property (nonatomic,strong) UIImageView *person1ImageView;
@property (nonatomic,strong) UIImageView *person2ImageView;

@end

@implementation ADFanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backScrollView];
    [self.backScrollView addSubview:self.topicTableView];
    [self.backScrollView addSubview:self.productTableView];
    [self.backScrollView addSubview:self.adccTableView];
    [self.view addSubview:self.titlesView];
    [self.backScrollView addSubview:self.scrollView];
    [self.scrollView addSubview:self.pageScrollView];
    [self.scrollView addSubview:self.imageView];
    [self.scrollView addSubview:self.searchView];
    [self.scrollView addSubview:self.personView];
    [self.scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, maxYOf(self.personView)+kUDGap)];
    [self.imageView setImage:[UIImage imageNamed:@"image1"]];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - tableViewCell Datasource Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   if (self.selectedIndex==ADTopicPage) {
        return 1;
    }else if (self.selectedIndex==ADProductPage) {
        return 1;
    }else if (self.selectedIndex==ADCCShowPage) {
        return 10;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectedIndex==ADTopicPage) {
        return kADTopicCellH;
    }else if (self.selectedIndex==ADProductPage) {
        return kADProductCellH;
    }else if (self.selectedIndex==ADCCShowPage) {
        return kADCCShowsCellH;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell ;
    cell = (ADTopicCell*)[tableView dequeueReusableCellWithIdentifier:kADTopicCell];
    NSInteger index = self.selectedIndex;
    if (index==ADTopicPage) {
        ADTopicCell *cell = (ADTopicCell*)[self.topicTableView dequeueReusableCellWithIdentifier:kADTopicCell forIndexPath:indexPath];
        cell.topicImageView.image = [UIImage imageNamed:@"topic.jpg"];
        return cell;
    }else if(index == ADProductPage){
        ADProductCell *cell = (ADProductCell*)[tableView dequeueReusableCellWithIdentifier:kADProductCell];
        cell.backImageView.image = [UIImage imageNamed:@"person.jpg"];
        cell.headImageView.image = [UIImage imageNamed:@"headimage"];
        return cell;
    }else if(index == ADCCShowPage){
        ADCCShowsCell *cell = (ADCCShowsCell*)[tableView dequeueReusableCellWithIdentifier:kADCCShowsCell];
        cell.showImageView.image = [UIImage imageNamed:@"show.jpg"];
        return cell;
    }
    return [[UITableViewCell alloc] init];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectedIndex==ADTopicPage) {
        ADTopicDetailController *topicVC = [[ADTopicDetailController alloc] init];
        [topicVC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:topicVC animated:YES];
    }else if (self.selectedIndex==ADProductPage) {
        ADProductDetailController *productDetailVC = [[ADProductDetailController alloc] init];
        [productDetailVC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:productDetailVC animated:YES];
    }else if (self.selectedIndex==ADCCShowPage) {
        
    }
}



#pragma mark - UICollectionView Datasource Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ADSearchProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kADSearchProductCell forIndexPath:indexPath];
    return cell;
}


#pragma mark - TIPageScrollView DataSource Delegate

- (NSInteger)tiNumberOfImages{
    return 10;
}

- (NSURL *)tiImageUrlAtIndex:(NSUInteger)index{
    return [NSURL URLWithString:@"http://qiaolianimage.oss-cn-hangzhou.aliyuncs.com/head.jpg"];
}

- (void)tiPageScrollView:(TIPageScrollView *)pageScrollView didSelectedAtIndex:(NSUInteger)index{
    
}



#pragma mark - action Listener
- (void)titleSelected:(UIButton*)btn{
    [self.scrollView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, heightOf(self.scrollView))];
    
    UIButton *preBtn = [self.titlesView viewWithTag:self.selectedIndex+kBaseTag];
    if (preBtn) [preBtn color:[UIColor blackColor]];
    
    self.selectedIndex = btn.tag-kBaseTag;
    [btn color:COLOR_MAIN];
    [self reloadTableViewAtSelectedIndex:self.selectedIndex];
    [self scrollToIndex:self.selectedIndex];
    
}

#pragma mark - private

- (void)reloadTableViewAtSelectedIndex:(NSInteger)index{
    if (index>0) {
        switch (index) {
            case 1:
                [self.topicTableView reloadData];
                break;
            case 2:
                [self.productTableView reloadData];
                break;
            case 3:
                [self.adccTableView reloadData];
                break;
            default:
                break;
        }
        
    }
}

- (void)scrollToIndex:(NSInteger)index{
    [self.backScrollView setContentOffset:CGPointMake(index*SCREEN_WIDTH, 0) animated:YES];
}
#pragma mark - getter

//- (UITableView *)tableView{
//    if (!_ta) {
//        _<#statements#> = [[<#view#> alloc]init];
//    }
//    return _<#statements#>;
//}


- (UIView *)titlesView{
    if (!_titlesView) {
        CGFloat height = 34.0f;
        _titlesView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, height)];
        _titlesView.backgroundColor = [UIColor clearColor];
        NSArray *titles = @[@"首页",@"专题",@"作品",@"ADCC"];
        CGFloat wordW = SCREEN_WIDTH/4;
        for (NSInteger i =0 ; i<titles.count; i++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*wordW, 0, wordW, height)];
            [btn setTag:i+kBaseTag];
            [btn color:[UIColor blackColor]];
            [btn title:titles[i]];
            [btn addTarget:self Listener:@selector(titleSelected:)];
            [btn font:[UIFont systemFontOfSize:16]];
            [_titlesView addSubview:btn];
            
            if (i==0) [btn color:[UIColor yellowColor]];
            if (i<3) {
                CALayer *lineLayer = [[CALayer alloc] init];
                lineLayer.frame = CGRectMake((i+1)*wordW-0.5, 2, 1, height-2*2);
                lineLayer.backgroundColor = [UIColor whiteColor].CGColor;
                [_titlesView.layer addSublayer:lineLayer];
            }
        }
        
        
    }
    return _titlesView;
}

- (UIScrollView *)backScrollView{
    if (!_backScrollView) {
        _backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TAB_BAR_HEIGHT)];
        [_backScrollView setContentSize:CGSizeMake(SCREEN_WIDTH*4, SCREEN_HEIGHT)];
        [_backScrollView setBackgroundColor:[UIColor orangeColor]];
        [_backScrollView setPagingEnabled:YES];
        [_backScrollView setBounces:NO];
        [_backScrollView setScrollEnabled:NO];
    }
    return _backScrollView;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, -STATUS_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TAB_BAR_HEIGHT)];
        _scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_scrollView setBounces:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
    }
    return _scrollView;
}

- (TIPageScrollView *)pageScrollView{
    if (!_pageScrollView) {
        _pageScrollView = [[TIPageScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, heightOf(self.scrollView))];
        _pageScrollView.delegate = self;
        _pageScrollView.dataSource = self;
    }
    return _pageScrollView;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, maxYOf(self.pageScrollView)+kUDGap, SCREEN_WIDTH, kImageViewH)];
//        _imageView.backgroundColor = [UIColor yellowColor];
    }
    return _imageView;
}


- (ADSearchsView *)searchView{
    if (!_searchView) {
        _searchView = [[ADSearchsView alloc]initWithFrame:CGRectMake(0, maxYOf(self.imageView)+kUDGap, SCREEN_WIDTH, kSearchViewH)];
        _searchView.collectionView.delegate = self;
        _searchView.collectionView.dataSource = self;
    }
    return _searchView;
}

- (UIView *)personView{
    if (!_personView) {
        _personView = [[UIView alloc]initWithFrame:CGRectMake(0, maxYOf(self.searchView)+kUDGap, SCREEN_WIDTH, kPersonViewH)];
        
        self.person1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 227*YScale)];
        [self.person1ImageView setImage:[UIImage imageNamed:@"9.jpg"]];
        [_personView addSubview:self.person1ImageView];
        
        self.person2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, maxYOf(self.person1ImageView)+kUDGap, SCREEN_WIDTH, kPersonViewH-kUDGap-heightOf(self.person1ImageView))];
        [self.person2ImageView setImage:[UIImage imageNamed:@"8.jpg"]];
        [_personView addSubview:self.person2ImageView];
    }
    return _personView;
}

- (UITableView *)topicTableView{
    if (!_topicTableView) {
        _topicTableView = [[UITableView alloc]initWithFrame:CGRectMake(maxXOf(self.scrollView), 0, SCREEN_WIDTH, SCREEN_HEIGHT-TAB_BAR_HEIGHT)];
        [self setTableView:_topicTableView];
        [_topicTableView setTableHeaderView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)]];
        [_topicTableView registerClass:[ADTopicCell class] forCellReuseIdentifier:kADTopicCell];
        
    }
    return _topicTableView;
}

- (UITableView *)productTableView{
    if (!_productTableView) {
        _productTableView = [[UITableView alloc]initWithFrame:CGRectMake(maxXOf(self.topicTableView), minYOf(self.topicTableView), widthOf(self.topicTableView), heightOf(self.topicTableView))];
        [self setTableView:_productTableView];
        [_productTableView setTableHeaderView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)]];
        [_productTableView registerClass:[ADProductCell class] forCellReuseIdentifier:kADProductCell];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 96, SCREEN_WIDTH, 20)];
        [label setText:@"设计师空间作品展示"];
        [label setTextColor:COLOR_MAIN];
        [label setFont:[UIFont systemFontOfSize:14]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [_productTableView.tableHeaderView addSubview:label];
    }
    return _productTableView;
}

- (UITableView *)adccTableView{
    if (!_adccTableView) {
        _adccTableView = [[UITableView alloc]initWithFrame:CGRectMake(maxXOf(self.productTableView), minYOf(self.productTableView), widthOf(self.productTableView), heightOf(self.productTableView))];
        [self setTableView:_adccTableView];
        [_adccTableView setTableHeaderView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)]];
        [_adccTableView registerClass:[ADCCShowsCell class] forCellReuseIdentifier:kADCCShowsCell];
    }
    return _adccTableView;
}

- (void)setTableView:(UITableView*)tableView{
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    [tableView setTableHeaderView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

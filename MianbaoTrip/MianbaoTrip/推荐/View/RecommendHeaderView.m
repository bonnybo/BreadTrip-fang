//
//  RecommendHeaderView.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-4.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "RecommendHeaderView.h"

@implementation RecommendHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createViews];
    }
    return self;
}



- (void)createViews
{
    //广告栏
    _bannerView = [[CycleScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , 220)];
    _bannerView.backgroundColor = [UIColor redColor];
    [self addSubview:_bannerView];
    
//    每日精选故事
    
    UIImageView *imgBarView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 25, 6, 20)];
    imgBarView.image = [UIImage imageNamed:@"bar.png"];
    imgBarView.layer.cornerRadius = 2.0;
    imgBarView.layer.masksToBounds = YES;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(25, 15, 200, 40)];
    label.text = @"每日精选故事";
    label.font = [UIFont boldSystemFontOfSize:18];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, _bannerView.bottom+10, kScreenWidth, 60)];
    view.userInteractionEnabled = YES;
    UIButton *allBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth - 60, 15, 50, 40)];
    [allBtn setTitle:@"全部 >" forState:UIControlStateNormal];
    allBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [allBtn addTarget:self action:@selector(allbtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:allBtn];
    [view addSubview:label];
    [view addSubview:imgBarView];
    [self addSubview:view];

    
//    精彩故事
   
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
    flowlayout.minimumInteritemSpacing = 5;
    flowlayout.minimumLineSpacing = 10;
    flowlayout.itemSize = CGSizeMake(170, 200);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(10, _bannerView.bottom + 60, kScreenWidth - 20, 210 *2) collectionViewLayout:flowlayout];
    _collectionView.scrollEnabled = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
    [_collectionView registerClass:[StoryCollectionViewCell class] forCellWithReuseIdentifier:@"CEll"];
    
}
- (void)allbtnAction:(UIButton *)btn
{
    StorysViewController *storysVc = [[StorysViewController alloc]init];
    storysVc.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
    [self.navigationController pushViewController:storysVc animated:YES];
}


- (void)setData:(NSArray *)data
{
    if (_data != data) {
        _data = data;
        [_collectionView reloadData];
        [self setNeedsLayout];
    }
}
#pragma mark---代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CEll" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 10.0;
    cell.layer.masksToBounds = YES;
    
    cell.model = self.data[1][indexPath.row];
    
    return cell;
}

//跳转到详细的故事界面
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
     
    DetailStoryViewController *storyVc = [[DetailStoryViewController alloc]init];
    storyVc.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
    storyVc.title = @"故事详情";
    HotListModel *model = self.data[1][indexPath.row];
    storyVc.spot_id = model.spot_id;
    NSLog(@"storyVc.spot_id:%@",storyVc.spot_id);
    [self.navigationController pushViewController:storyVc animated:YES];
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    给广告栏赋值

    NSArray *arr = self.data[0];
    NSMutableArray *imgs = [NSMutableArray array];
    NSMutableArray *webArr = [NSMutableArray array];
    for (int i = 0; i < arr.count; i++) {
        AdModel *adModel = arr[i];
        UIImage *image = [UIImage sd_imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:adModel.image_url]]];
        [imgs addObject:image];
        [webArr addObject:adModel.html_url];
    }
    _bannerView.imgs = [NSArray arrayWithArray:imgs];
    _bannerView.webArr = [NSArray arrayWithArray:webArr];
}


@end

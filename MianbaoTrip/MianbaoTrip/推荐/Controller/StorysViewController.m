//
//  StorysViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-4.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "StorysViewController.h"

@interface StorysViewController ()

@end

@implementation StorysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"精选故事";

    [self createView];
    
    [self  requestData];
    
    

}

- (void)requestData
{
    [DataService requestWithURL:kHotList
                         params:nil
                     httpMethod:@"GET"
                 finishDidBlock:^(AFHTTPRequestOperation *operation, id result) {

//                     分析数据
                     _data = [NSMutableArray array];
                     _hotList = result[@"data"][@"hot_spot_list"];
                     for (NSDictionary *dic in _hotList) {
                         model = [[HotListModel alloc ]initContentWithDic:dic];
                         [_data addObject:model];
                     }
                     [_collectionView reloadData];
                     
                 } failuerBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                     NSLog(@"error:%@",error);
                 }];
}

- (void)createView
{
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
    flowlayout.minimumInteritemSpacing = 5;
    flowlayout.minimumLineSpacing = 10;
    flowlayout.itemSize = CGSizeMake(170, 200);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 10, kScreenWidth - 20, kScreenHeight -74) collectionViewLayout:flowlayout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    [_collectionView registerClass:[StoryCollectionViewCell class] forCellWithReuseIdentifier:@"hehe"];
    
    
//    [_collectionView addHeaderWithTarget:self action:@selector(headerAction)];
    [_collectionView addFooterWithTarget:self action:@selector(footerAction)];

    [self.view addSubview:_collectionView];
    
}


- (void)footerAction
{
    static int count = 12;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@(count) forKey:@"start"];
    

    [DataService requestWithURL:kNewList
                         params:params
                     httpMethod:@"GET"
                 finishDidBlock:^(AFHTTPRequestOperation *operation, id result) {
                     
                     NSLog(@"%@", result);
                     
                     NSArray *list = result[@"data"][@"hot_spot_list"];
                     NSMutableArray *arr = [NSMutableArray array];
                     for (NSDictionary *dic in list) {
                         HotListModel *hotModel = [[HotListModel alloc ]initContentWithDic:dic];
                         [arr addObject:hotModel];
                     }
                     if (arr.count > 0) {
                        
                         [self.data addObjectsFromArray:arr];
                         [_collectionView reloadData];

                     }else{
                         [_collectionView removeFooter];
                     }
                     [_collectionView footerEndRefreshing];
                 } failuerBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                     NSLog(@"加载失败");
                     [_collectionView footerEndRefreshing];
                 }];
    count = count + 12;
}




#pragma mark---代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hehe" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 10.0;
    cell.layer.masksToBounds = YES;
//    传值
    cell.model = self.data[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailStoryViewController *storyVc = [[DetailStoryViewController alloc]init];
    storyVc.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
    storyVc.title = @"故事详情";
    HotListModel *listModel = self.data[indexPath.row];
    storyVc.spot_id = listModel.spot_id;
    [self.navigationController pushViewController:storyVc animated:YES];
}




@end

//
//  RecommendViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "RecommendViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface RecommendViewController ()<CLLocationManagerDelegate>
{
    CycleScrollView *bannerView;
    CLLocationManager *_locationManager;

}
@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];

    self.automaticallyAdjustsScrollViewInsets = NO;

//    创建缓冲动画
    [self createAnimation];
    
    
//    请求数据
    [self requestData];
    
    [self requestLocation];

  
}

//缓冲动画
- (void)createAnimation
{
    
    yunView = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth - 80)/2, (kScreenHeight-50-49-64)/2, 80, 50)];
    yunView.image = [UIImage imageNamed:@"yun.png"];
    
    littleYunView = [[UIImageView alloc]initWithFrame:CGRectMake(yunView.right-15, yunView.top+10, 60, 40)];
    littleYunView.image = [UIImage imageNamed:@"yun.png"];
    
    [self.view addSubview:yunView];
    [self.view insertSubview:littleYunView belowSubview:yunView];
     NSLog(@"%.2f",yunView.right);

    

    CABasicAnimation *bigCloudAnimation = [CABasicAnimation animation];
    bigCloudAnimation.repeatCount = 1000;
    bigCloudAnimation.duration = 2;
    bigCloudAnimation.autoreverses = YES;
    bigCloudAnimation.fromValue = @0;
    bigCloudAnimation.toValue = @25;
    bigCloudAnimation.keyPath = @"transform.translation.x";
    [yunView.layer addAnimation:bigCloudAnimation forKey:@"bigCloudAnimation"];
    
    
    CABasicAnimation *smallCloudAnimation = [CABasicAnimation animation];
    smallCloudAnimation.repeatCount = 1000;
    smallCloudAnimation.duration = 2;
    smallCloudAnimation.autoreverses = YES;
    smallCloudAnimation.fromValue = @0;
    smallCloudAnimation.toValue = @-25;
    smallCloudAnimation.keyPath = @"transform.translation.x";
    [littleYunView.layer addAnimation:smallCloudAnimation forKey:@"smallCloudAnimation"];
    

}


//    请求数据
- (void)removeAnnimation
{
    [yunView.layer removeAnimationForKey:@"bigCloudAnimation"];
    [littleYunView.layer removeAnimationForKey:@"smallCloudAnimation"];
    yunView.hidden = YES;
    littleYunView.hidden = YES;
}
- (void)requestData
{
    
    [DataService requestWithURL:kIndex
                         params:nil
                     httpMethod:@"GET"
                 finishDidBlock:^(AFHTTPRequestOperation *operation, id result) {
//                     [self completeHUD:@"加载完成"];
                     NSLog(@"首页数据请求成功！");
                     
//                    移除 缓冲视图
                     [self removeAnnimation];
                  
//                     数据请求成功创建表
                     [self createMainTableView];
                     
//                     分析next_start
                     next_start = result[@"next_start"];
                     
                     
//                   分析搜索栏数据
                     NSMutableArray *searchMArr = [NSMutableArray array];
                     searchArr = result[@"search_data"];
                     for (NSUInteger i = 0; i < searchArr.count; i++) {
                         NSArray *arr = [searchArr[i] objectForKey:@"elements"];
                         for (NSDictionary *dic in arr) {
                             SearchModel *searchModel = [[SearchModel alloc]initContentWithDic:dic];
                             [searchMArr addObject:searchModel];
                         }
                     }
                     self.data = searchMArr;
//                     NSLog(@"%@",self.data);
                     
//                     分析获取广告栏信息
                     NSArray *elements = result[@"elements"];
                     NSArray *adData = elements[0][@"data"][0];
                     NSMutableArray *bannerArr = [NSMutableArray array];
                     for (NSDictionary *dic in adData) {
                         AdModel *adModel = [[AdModel alloc]initContentWithDic:dic];
                         [bannerArr addObject:adModel];
                     }
                     
//                     分析每日精选故事数据
                     _storyData = [NSMutableArray array];
                     for (int i = 2; i < 2+4; i++) {
                         NSDictionary *dic = elements[i];
                         NSArray *data = [dic objectForKey:@"data"];
                         MainStoryModel *storyModel = [[MainStoryModel alloc]initContentWithDic:data[0]];
                         [_storyData addObject:storyModel];
                     }
//                     头视图的数据
                     NSMutableArray *headerData = [NSMutableArray array];
                     [headerData addObject:bannerArr];
                     [headerData addObject:_storyData];
                     headerView.data = headerData;

//                   分析游记数据
                     _youjiArr = [NSMutableArray array];
                     for (int i = 7; i < elements.count - 7; i++) {
                         NSDictionary *dic = elements[i];
                         YoujiTypeModel *youjiTypeModel = [[YoujiTypeModel alloc]initContentWithDic:dic];
                         [_youjiArr addObject:youjiTypeModel];
                     }
                    _tableView.data = _youjiArr;
//                     NSLog(@"_tableView.data :%@",_tableView.data);
                    [_tableView reloadData];
 
                 } failuerBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                     NSLog(@"错误：%@",error);
                 }];

}

- (void)createMainTableView
{
    if (_tableView == nil) {
        _tableView = [[RecomendTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight -64-49) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor clearColor];
        
        [self.view addSubview:_tableView];
        //    头视图
        headerView = [[RecommendHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 440+250)];
        _tableView.tableHeaderView = headerView;
        
        //    上拉和下拉刷新
        [_tableView addHeaderWithTarget:self action:@selector(headerAction)];
        [_tableView addFooterWithTarget:self action:@selector(footerAction)];
    }else{
//        什么也不做！！
    }
    
}

- (void)headerAction
{
    [self requestData];
//    [_tableView removeHeader];
    [_tableView headerEndRefreshing];
}

- (void)footerAction
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:next_start forKey:@"next_start"];
    
    NSLog(@"%@?next_start=%@",kIndex,params);
    [DataService requestWithURL:kIndex
                         params:params
                     httpMethod:@"GET"
                 finishDidBlock:^(AFHTTPRequestOperation *operation, id result) {
                     
                     next_start = result[@"next_start"];
                     NSArray *list = result[@"elements"];
                     NSMutableArray *arr = [NSMutableArray array];
                     for (NSDictionary *dic in list) {
                         YoujiTypeModel *hotModel = [[YoujiTypeModel alloc ]initContentWithDic:dic];
                         [arr addObject:hotModel];
                     }
                     if (arr.count > 0) {
                         [self.youjiArr addObjectsFromArray:arr];
                         _tableView.data = self.youjiArr;
                         [_tableView reloadData];
                         
                     }else{
                         [_tableView removeFooter];
                     }
                     [_tableView footerEndRefreshing];
                     
                 } failuerBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                     [_tableView footerEndRefreshing];
                 }];
}


- (void)requestLocation
{
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    _locationManager.delegate = self;
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        [_locationManager requestAlwaysAuthorization];
    }
    [_locationManager startUpdatingLocation];
    
}
#pragma mark -CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coor2D = location.coordinate;
    [_locationManager stopUpdatingLocation];
    //    存储位置
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%f", coor2D.latitude] forKey:@"lat"];
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%f", coor2D.longitude] forKey:@"lng"];
    
}


@end

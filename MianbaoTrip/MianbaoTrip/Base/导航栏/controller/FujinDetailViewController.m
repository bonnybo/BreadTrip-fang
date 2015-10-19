//
//  FujinDetailViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "FujinDetailViewController.h"

@interface FujinDetailViewController ()

@end

@implementation FujinDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTableView];
    
//    请求数据
    [self requestData];
    
}

- (void)requestData
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSNumber numberWithInteger:_catrgory] forKey:@"category"];
    [params setObject:@0 forKey:@"start"];
    [params setObject:@20 forKey:@"count"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [params setObject:[defaults objectForKey:@"lng"] forKey:@"longitude"];
    [params setObject:[defaults objectForKey:@"lat"] forKey:@"latitude"];

    [DataService requestWithURL:kNearby_place
                         params:params
                     httpMethod:@"GET"
                 finishDidBlock:^(AFHTTPRequestOperation *operation, id result) {
                     NSArray *items = result[@"items"];
                     _data = [NSMutableArray array];
                     for (NSDictionary *dic in items) {
                         FujinModel *placeModel = [[FujinModel alloc]initContentWithDic:dic];
                         [_data addObject:placeModel];
                     }
                     [_tableView reloadData];
                 } failuerBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                     NSLog(@"error:%@",error);
                 }];
}


- (void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 49-40) style:UITableViewStylePlain];
//    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 185;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
    [_tableView addHeaderWithTarget:self action:@selector(headerAction)];
    [_tableView addFooterWithTarget:self action:@selector(footerAction)];
    [self.view addSubview:_tableView];
}

- (void)headerAction
{
    [self requestData];
//    [_tableView removeHeader];
    [_tableView headerEndRefreshing];
}

- (void)footerAction
{
    
    NSInteger count = self.data.count;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSNumber numberWithInteger:_catrgory] forKey:@"category"];
    [params setObject:[NSString stringWithFormat:@"%ld",count] forKey:@"start"];
    [params setObject:@20 forKey:@"count"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [params setObject:[defaults objectForKey:@"lng"] forKey:@"longitude"];
    [params setObject:[defaults objectForKey:@"lat"] forKey:@"latitude"];

    [DataService requestWithURL:kNearby_place
                         params:params
                     httpMethod:@"GET"
                 finishDidBlock:^(AFHTTPRequestOperation *operation, id result) {
                     
//                     NSLog(@"%@",result);
                     
                     NSArray *items = result[@"items"];
                     NSMutableArray *arr = [NSMutableArray array];
                     for (NSDictionary *dic in items) {
                         FujinModel *fujinModel = [[FujinModel alloc]initContentWithDic:dic];
                         [arr addObject:fujinModel];
                     }
                     if (arr.count > 0) {
                         [self.data addObjectsFromArray:arr];
                         
                         [_tableView reloadData];
                     }else{
                         [_tableView removeFooter];
                     }
                   [_tableView footerEndRefreshing];
                 } failuerBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                     [_tableView footerEndRefreshing];
                 }];
    count += 20;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"CEll";
    FujinDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"FujinDetailTableViewCell" owner:nil options:nil]lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    cell.placeModel = _data[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetaiStorelViewController *detailVC = [[DetaiStorelViewController alloc]init];
    FujinModel *fujinModel = _data[indexPath.row];
    detailVC.place_id = fujinModel.place_id;
    detailVC.place_description = fujinModel.place_description;
    detailVC.rating = [fujinModel.rating integerValue];
    detailVC.comment_count = [fujinModel.comments_count integerValue];
    detailVC.name = fujinModel.name;
    [self.navigationController pushViewController:detailVC animated:YES];
    NSLog(@"id:%@",fujinModel.place_id);
}


@end

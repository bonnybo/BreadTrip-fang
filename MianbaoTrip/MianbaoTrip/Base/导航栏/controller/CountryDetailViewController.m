//
//  CountryDetailViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "CountryDetailViewController.h"
#import "CExpandHeader.h"
@interface CountryDetailViewController ()
{
    UIImageView *imgview;
    CExpandHeader *header;
}
@end

@implementation CountryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.navigationController.navigationBar.alpha = 0;
//    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
//    创建导航栏
    [self initNavView];
 
//    创建视图层
    [self _initViews];

//    请求数据
    [self requestData];
    
    
    
}
- (void)initNavView
{
    loveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loveBtn.frame = CGRectMake(kScreenWidth - 60, 25, 20, 20);
    [loveBtn setImage:[UIImage imageNamed:@"love.png"] forState:UIControlStateNormal];
    
    shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(loveBtn.right+10, 25, 20, 20);
    [shareBtn setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];

    [self.navigationController.view addSubview:loveBtn];
    [self.navigationController.view addSubview:shareBtn];
    

}
- (void)createBackBtn
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view.backgroundColor = [UIColor clearColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    
    backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(15, 25, 20, 15);
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:backBtn];
}

- (void)backAction:(UIButton *)btn
{
    [backBtn removeFromSuperview];
    [loveBtn removeFromSuperview];
    [shareBtn removeFromSuperview];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)requestData
{
    NSString *urlstr = [NSString stringWithFormat:@"%@%@/%@",kTaiguo, self.type,self.city_id];
    [DataService requestWithURL:urlstr
                         params:nil
                     httpMethod:@"GET"
                 finishDidBlock:^(AFHTTPRequestOperation *operation, id result) {

                     self.data = result;
//              赋值
                     self.title = self.data[@"name"];
                     countryLabel.text = self.data[@"name"];
                     goLabel.text = [NSString stringWithFormat:@"%@人 去过/%@人 喜欢",self.data[@"visited_count"],self.data[@"wish_to_go_count"]];

                     NSString *imgstr = self.data[@"share_args"][@"default"][@"shr_image"];
                     [imgview sd_setImageWithURL:[NSURL URLWithString:imgstr]];

                     [_tableview reloadData];
                     
                     
                 } failuerBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                     NSLog(@"ERRor:%@",error);
                 }];
    
    
}

//创建表视图
- (void)_initViews
{
    [self createHeaderView];
    
    UIButton *btn = (UIButton *)[_headerView viewWithTag:10000];
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    //    图片
    imgview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
    imgview.userInteractionEnabled = YES;
    imgview.backgroundColor = [UIColor clearColor];
    header = [CExpandHeader expandWithScrollView:_tableview expandView:imgview];
    //    国家
    countryLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, btn.top - 70, 200, 40)];
    countryLabel.tag = 104;
    countryLabel.backgroundColor = [UIColor clearColor];
    countryLabel.textAlignment = NSTextAlignmentLeft;
    countryLabel.textColor = [UIColor whiteColor];
    countryLabel.font = [UIFont boldSystemFontOfSize:25];
    [_headerView addSubview:countryLabel];
    
    //    1.9万人去过
    goLabel = [[UILabel alloc]initWithFrame:CGRectMake(20,countryLabel.bottom, 300, 30)];
    goLabel.tag = 102;
    goLabel.backgroundColor = [UIColor clearColor];
    goLabel.textColor = [UIColor whiteColor];
    goLabel.font = [UIFont systemFontOfSize:14];
    [_headerView addSubview:goLabel];
    
    _tableview.backgroundColor = [UIColor clearColor];
    _tableview.showsVerticalScrollIndicator = NO;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.delegate = self;
    _tableview.dataSource = self;
//    NSArray *arr = [self.data objectForKey:@"hottest_places"];
    _tableview.rowHeight = 170 *3 ;
    _tableview.tableHeaderView.height = 220;
    _tableview.tableHeaderView = _headerView;
    _tableview.tableHeaderView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableview];
    
    
}

//创建头视图
- (void)createHeaderView
{
    
 
        //创建
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 220)];
        _headerView.backgroundColor = [UIColor clearColor];
        
    
        //    五个按钮
        for (int i = 0; i < 6; i ++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = 10000 + i;
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
            btn.backgroundColor = [UIColor clearColor];
            [btn setBackgroundImage:img forState:UIControlStateNormal];
            if (i <5) {
                btn.frame = CGRectMake(kScreenWidth/4*(i -1), 0, kScreenWidth/4, 90);
            }else{
                btn.frame = CGRectMake(0, 90 , kScreenWidth/4, 90);
            }
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            [_headerView addSubview:btn];
        }
        
        //    推荐城市
        UIImageView *titleView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 420 - 250, kScreenWidth, 40)];
        titleView.image = [UIImage imageNamed:@"title.png"];
        [_headerView addSubview:titleView];
        
//        [_headerView addSubview:imgview];
    
}


////橡皮筋效果
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat yoffset = scrollView.contentOffset.y;
//    
//    if (yoffset < 0) {
//        //        往下拉
//        UIImageView *imgview = (UIImageView *)[_headerView viewWithTag:101];
//        //        计算图片的宽度
//        CGFloat width = kScreenWidth/250*(250-yoffset);
//        imgview.frame = CGRectMake((kScreenWidth-width)/2, yoffset,width, 250-yoffset);
//        [countryLabel removeFromSuperview];
//        [self.view addSubview:countryLabel];
//        
//        [goLabel removeFromSuperview];
//        [self.view addSubview:goLabel];
//        
//        
//        countryLabel.top = 180 - yoffset;
//        goLabel.top = 215 - yoffset;
//    }else {
//        [countryLabel removeFromSuperview];
//        [_headerView addSubview:countryLabel];
//        
//        [goLabel removeFromSuperview];
//        [_headerView addSubview:goLabel];
//
//        countryLabel.top = 180;
//        goLabel.top = 215;
//        
//        UIImageView *imgview = (UIImageView *)[_headerView viewWithTag:101];
//        if (yoffset > imgview.height - 25) {
//            [UIView animateWithDuration:1
//                             animations:^{
//                                 self.navigationController.navigationBar.alpha = 1;
//                             }];
//        }else if (yoffset < imgview.height + 25){
//            [UIView animateWithDuration:1
//                             animations:^{
//                                 self.navigationController.navigationBar.alpha = 0;
//                             }];
//        }
//
//    }
//
//}
//

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.navigationController.navigationBar.alpha = scrollView.contentOffset.y/imgview.height;
//    countryLabel.bottom = imgview.height-70 - scrollView.contentOffset.y;
//    goLabel.bottom = countryLabel.bottom + 30 - scrollView.contentOffset.y;
//    
//    [imgview addSubview:countryLabel];
//    [imgview addSubview:goLabel];
}

- (void)btnAction:(UIButton *)btn
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"..." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:sure];
    [self presentViewController:alert animated:YES completion:nil];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"CELL";
    CountryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CountryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
//    传值
    cell.data = [self.data objectForKey:@"hottest_places"];
    cell.tag = 900;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.alpha = 1;
}



@end

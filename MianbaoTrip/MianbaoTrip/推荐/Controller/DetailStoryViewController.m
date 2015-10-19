//
//  DetailStoryViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-6.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "DetailStoryViewController.h"
#import "MainTabBarController.h"
@interface DetailStoryViewController ()

@end

@implementation DetailStoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    获取到当前的tabbar控制器
//    MainTabBarController *mainTBC = (MainTabBarController *)self.navigationController.tabBarController;
    

//    创建内容视图
    [self createTableView];
    
    //    创建导航栏
    [self initViews];
}

- (void)initViews
{
//    创建导航栏的按钮
    UIButton *loveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loveBtn.frame = CGRectMake(0, 0, 20, 20);
    [loveBtn setImage:[UIImage imageNamed:@"love.png"] forState:UIControlStateNormal];
    
    UIButton *ShareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ShareBtn.frame = CGRectMake(loveBtn.right, 0, 20, 20);
    [ShareBtn setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc]initWithCustomView:loveBtn];
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc]initWithCustomView:ShareBtn];
    self.navigationItem.rightBarButtonItems = @[right2,right1];
    
    
//    创建评论框
    UIView *commitView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 64-65, kScreenWidth, 65)];
    commitView.alpha = 1;
    commitView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
   
    UITextView *commitTextView = [[UITextView alloc]initWithFrame:CGRectMake(20, 10, kScreenWidth-100, 55)];
    commitTextView.backgroundColor = [UIColor clearColor];
    commitTextView.text = @"添加评论...";
    commitTextView.font = [UIFont systemFontOfSize:17];
    commitTextView.textColor = [UIColor grayColor];

//    [commitTextView setValue:[UIColor darkGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
//    [commitTextView setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [commitView addSubview:commitTextView];
    
    UIButton *checkBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [checkBtn setImage:[UIImage imageNamed:@"commit.png"] forState:UIControlStateNormal];
    checkBtn.frame = CGRectMake(commitTextView.right+5 , (55-30)/2, 50, 30);
    [checkBtn addTarget:self action:@selector(commitAction) forControlEvents:UIControlEventTouchUpInside];
    [commitView addSubview:checkBtn];
    [self.view addSubview:commitView];
    
    
}
- (void)commitAction
{
    
}

- (void)createTableView
{
    _tableView = [[DetailStoryTableView alloc]initWithFrame:CGRectMake(15,0,kScreenWidth-30,kScreenHeight - 85) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
}

//当_spot_id数据有值的时候再请求数据
- (void)setSpot_id:(NSString *)spot_id
{
    if (_spot_id != spot_id) {
        _spot_id = spot_id;
        _tableView.spot_id = _spot_id;
    }
}



@end

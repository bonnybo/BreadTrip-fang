//
//  BaseSearchViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-4.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseSearchViewController.h"

@interface BaseSearchViewController ()

@end

@implementation BaseSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
   

//    创建导航栏上的按钮
    [self createNavItems];
//    创建表格
//    [self ceateTableView];
}
- (void)createNavItems
{
    //    搜索框
    inputField = [[UITextField alloc]initWithFrame:CGRectMake(10,3, kScreenWidth - 100,35)];
    UIImage *image = [UIImage imageNamed:@"search_bac.png"];
    [image stretchableImageWithLeftCapWidth:5.0 topCapHeight:5.0];
    inputField.background = image;
    inputField.placeholder = @" 搜索国家、城市、景区、游记名";
    [inputField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [inputField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    inputField.textColor = [UIColor whiteColor];
    inputField.textAlignment = NSTextAlignmentCenter;
    [inputField addTarget:self action:@selector(editing:) forControlEvents:UIControlEventAllEditingEvents];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:inputField];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    UIView *rightView = [[UIView alloc]initWithFrame: CGRectMake(inputField.right + 10, inputField.top, 70, 35)];
    rightView.backgroundColor = [UIColor clearColor];
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelBtn.backgroundColor = [UIColor clearColor];
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [_cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _cancelBtn.hidden = YES;
    _cancelBtn.frame = rightView.bounds;
    
    _fujinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _fujinBtn.backgroundColor = [UIColor clearColor];
    [_fujinBtn setTitle:@"附近" forState:UIControlStateNormal];
    [_fujinBtn addTarget:self action:@selector(fujinAction) forControlEvents:UIControlEventTouchUpInside];
    [_fujinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _fujinBtn.hidden = NO;
    _fujinBtn.frame = rightView.bounds;
    
    
   
    [rightView addSubview:_cancelBtn];
    [rightView addSubview:_fujinBtn];
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc]initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItem = right2;

}

- (void)fujinAction
{
    NSLog(@"附近");
    FujinViewController *fujinVc = [[FujinViewController alloc]init];
    [self.navigationController pushViewController:fujinVc animated:YES];
}

//弹出搜索表
- (void)editing:(UITextField *)inputField
{
    if (_searchTableView == nil) {
        [self  ceateTableView];
    }
    
    _fujinBtn.hidden = YES;
    _cancelBtn.hidden = NO;
    _searchTableView.hidden = NO;
//    [_cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];

}
//收起搜索表
- (void)cancelAction:(UIButton *)btn
{
    [inputField resignFirstResponder];

    _cancelBtn.hidden = YES;
    _fujinBtn.hidden = NO;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         _searchTableView.frame = CGRectMake(0, 0, 0, kScreenHeight);
                     } completion:^(BOOL finished) {
                         _searchTableView = nil;
                         [_searchTableView removeFromSuperview];
                         [_fujinBtn addTarget:self action:@selector(fujinAction) forControlEvents:UIControlEventTouchUpInside];
                     }];
    
}



#pragma mark--创建表格
- (void)ceateTableView
{
    _searchTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49) style:UITableViewStyleGrouped];
    
    _searchTableView.backgroundColor = [UIColor colorWithRed:231.0/255.0 green:240.0/255.0 blue:202.0/255.0 alpha:1];
    _searchTableView.delegate = self;
    _searchTableView.dataSource = self;
    _searchTableView.hidden = YES;
    _searchTableView.rowHeight = 180;
    _searchTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _searchTableView.separatorColor = [UIColor colorWithRed:103.0/255.0 green:183.0/255.0 blue:182.0/255.0 alpha:1];
    [self.view addSubview:_searchTableView];
}
#pragma mark----创建表格代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return searchArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *dic = searchArr[section];
    return  [dic objectForKey:@"title"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 200, 40)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor blackColor];
    NSDictionary *dic = searchArr[section];
    label.text = [NSString stringWithFormat:@"     %@",[dic objectForKey:@"title"]];
    return label;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"CELL";
    NavTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NavTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.data = searchArr[indexPath.section];
    cell.mArr = mArr;
    return cell;
}



@end

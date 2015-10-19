//
//  SecondBaseViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-4.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "SecondBaseViewController.h"

@interface SecondBaseViewController ()

@end

@implementation SecondBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    设置导航栏半透明
//    self.navigationController.navigationBar.translucent = YES;
    [self createBackBtn];

}
- (void)createBackBtn
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(15, 25, 20, 15);
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)backAction:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end

//
//  FunViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "FunViewController.h"

@interface FunViewController ()

@end

@implementation FunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"城市猎人带你玩";

    [self createNavItems];
    
    
    
}

- (void)createNavItems
{
    UIButton *locationBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    locationBtn.frame = CGRectMake(5, 10, 50, 30);
    [locationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [locationBtn setTitle:@"北京>" forState:UIControlStateNormal];
    [locationBtn addTarget:self action:@selector(locationAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:locationBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(5, 10, 50, 30);
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn setTitle:@"筛选" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(locationAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    

   
    
    
}

- (void)locationAction
{
    
}

@end

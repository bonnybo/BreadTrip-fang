//
//  FujinViewController.m
//  MianbaoTrip
//
//  Created by Mac on 15-10-4.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "FujinViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface FujinViewController ()
@end

@implementation FujinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的附近";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
   

//    从左到右是 0 11 10 5 21 6
    NSArray *catrgory = @[@0,@11,@10,@5,@21,@6];
    FujinDetailViewController *oneViewController = [[FujinDetailViewController alloc] init];
    oneViewController.catrgory = [catrgory[0]integerValue];
    oneViewController.title = @"全部";
    oneViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
    
    FujinDetailViewController *twoViewController = [[FujinDetailViewController alloc] init];
    twoViewController.catrgory = [catrgory[1]integerValue];
    twoViewController.title = @"景点";
    twoViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
    
    FujinDetailViewController *threeViewController = [[FujinDetailViewController alloc] init];
    threeViewController.catrgory = [catrgory[2]integerValue];
    threeViewController.title = @"住宿";
    threeViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
    
    FujinDetailViewController *fourViewController = [[FujinDetailViewController alloc] init];
    fourViewController.catrgory = [catrgory[3]integerValue];
    fourViewController.title = @"餐厅";
    fourViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
    
    FujinDetailViewController *fiveViewController = [[FujinDetailViewController alloc] init];
    fiveViewController.catrgory = [catrgory[4]integerValue];
    fiveViewController.title = @"休闲娱乐";
    fiveViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
    
    FujinDetailViewController *sixViewController = [[FujinDetailViewController alloc] init];
    sixViewController.catrgory = [catrgory[5]integerValue];
    sixViewController.title = @"购物";
    sixViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgcolor.png"]];
    
    
    SCNavTabBarController *navTabBarController = [[SCNavTabBarController alloc] init];
    navTabBarController.subViewControllers = @[oneViewController, twoViewController, threeViewController, fourViewController, fiveViewController, sixViewController];
    //navTabBarController.showArrowButton = YES;
    [navTabBarController addParentController:self];
    
}



@end

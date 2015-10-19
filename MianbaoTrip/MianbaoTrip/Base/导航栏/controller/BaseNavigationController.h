//
//  BaseNavigationController.h
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchModel.h"
#import "MainTabBarController.h"
#import "NavTableViewCell.h"
#import "WXNavigationController.h"

@interface BaseNavigationController : WXNavigationController<UINavigationControllerDelegate>
{
    UIButton *_search;
    UIButton *_cancelBtn;
    NSMutableArray *mArr;
    NSArray *searchArr;
    UITextField *inputField;
    @public
    UITableView *_searchTableView;
}

@property (nonatomic,strong) NSArray *data;

@end

//
//  BaseSearchViewController.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-4.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavTableViewCell.h"
#import "CountryDetailViewController.h"
#import "FujinViewController.h"

@interface BaseSearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
   
    UIButton *_cancelBtn;
    UIButton *_fujinBtn;
    NSMutableArray *mArr;
    NSArray *searchArr;
    UITextField *inputField;
    UITableView *_searchTableView;
}

@property (nonatomic,strong) NSArray *data;

@end

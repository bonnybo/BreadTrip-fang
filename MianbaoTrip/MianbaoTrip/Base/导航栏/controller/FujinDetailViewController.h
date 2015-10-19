//
//  FujinDetailViewController.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FujinDetailTableViewCell.h"
#import "DetaiStorelViewController.h"
#import "FujinPlaceModel.h"
#import "FujinModel.h"

@interface FujinDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_tableView;
}

@property (nonatomic,strong) NSMutableArray *data;
@property (nonatomic,assign) NSInteger catrgory;
@end

//
//  DetailStoryViewController.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-6.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "SecondBaseViewController.h"
#import "StoryDetailListModel.h"
#import "UserModel.h"
#import "DetailStoryTableView.h"


@interface DetailStoryViewController : SecondBaseViewController

{
    DetailStoryTableView *_tableView;
}


@property (nonatomic,copy) NSString *spot_id;
@end

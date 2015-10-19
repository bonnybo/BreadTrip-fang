//
//  RecommendViewController.h
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdModel.h"
#import "RecommendHeaderView.h"
#import "BaseSearchViewController.h"
#import "MainStoryModel.h"
#import "RecomendTableView.h"
#import "YoujiModel.h"
#import "YoujiTypeModel.h"

@interface RecommendViewController : BaseSearchViewController{
    RecomendTableView *_tableView;
    RecommendHeaderView *headerView;
    UIImageView *yunView;
    UIImageView *littleYunView;
    NSNumber *next_start;
}

@property (nonatomic,strong) NSArray *bannerData;
@property (nonatomic,strong) NSMutableArray *storyData;
@property (nonatomic,strong) NSMutableArray *youjiArr;




@end

//
//  RecommendHeaderView.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-4.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailStoryViewController.h"
//#import "BannerScrollView.h"
#import "StorysViewController.h"
#import "StoryCollectionViewCell.h"
#import "MainStoryModel.h"
#import "CycleScrollView.h"
#import "AdModel.h"
#import "HotListModel.h"

@interface RecommendHeaderView : UIView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
{
    UITableView *_headerTableView;
    UICollectionView *_collectionView;
    CycleScrollView *_bannerView;
}

@property (nonatomic,strong) NSArray *data;

@end

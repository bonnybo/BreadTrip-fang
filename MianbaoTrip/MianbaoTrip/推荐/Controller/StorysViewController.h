//
//  StorysViewController.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-4.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseViewController.h"
#import "HotListModel.h"
#import "StoryCollectionViewCell.h"
#import "DetailStoryViewController.h"

@interface StorysViewController : SecondBaseViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

{
    UICollectionView *_collectionView;
    
    
//    NSArray *hotList;
    HotListModel *model;
    
}
@property (nonatomic,strong) NSArray *hotList;
@property (nonatomic,strong) NSMutableArray *data;
@end

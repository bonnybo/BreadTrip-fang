//
//  NavTableViewCell.h
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchModel.h"
#import "CountryDetailViewController.h"

@interface NavTableViewCell : UITableViewCell<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
{
    UIImageView *_cellImg;
    NSMutableArray *_mArr ;
}

@property (nonatomic,strong) NSDictionary *data;

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *mArr;
@property (nonatomic,strong) SearchModel *model;
@end

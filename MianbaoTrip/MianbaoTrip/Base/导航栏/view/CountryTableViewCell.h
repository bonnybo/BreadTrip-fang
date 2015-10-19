//
//  CountryTableViewCell.h
//  MianbaoTrip
//
//  Created by Mac on 15-9-29.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryTableViewCell : UITableViewCell<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

{
     UICollectionView *_collectionView;
}


//@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *data;
@end

//
//  StoryCollectionViewCell.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotListModel.h"

@interface StoryCollectionViewCell : UICollectionViewCell

{
    UIImageView *imgView;
    UILabel *addressLabel;
    UILabel *textLabel ;
    UIImageView *personImgView;
    UILabel *nameLabel;
}

@property (nonatomic,strong) HotListModel *model;

@end

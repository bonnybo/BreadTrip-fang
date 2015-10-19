//
//  DetailStoryTableViewCell.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-6.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryDetailListModel.h"
@interface DetailStoryTableViewCell : UITableViewCell
{
//    UIImageView *imgView;
//    UILabel *descriptionLabel;
}

@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UILabel *descriptionLabel;


@property (nonatomic,strong) StoryDetailListModel *storyListModel;

@end

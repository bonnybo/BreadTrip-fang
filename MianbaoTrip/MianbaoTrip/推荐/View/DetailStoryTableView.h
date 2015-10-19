//
//  DetailStoryTableView.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-6.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryDetailListModel.h"
#import "UserModel.h"
#import "DetailTBFooterView.h"
#import "DetailStoryTableViewCell.h"
//#import ""

@interface DetailStoryTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *personImg;
    UILabel *nameLabel;
    UILabel *addressLabel;
    UILabel *titleLabel;
    NSString *text;
    UILabel *storyLabel;
    DetailTBFooterView *footerView;
    UIImageView *yunView;
    UIImageView *littleYunView;
}

@property (nonatomic,copy) NSString *spot_id;
@property (nonatomic,strong) NSMutableArray *usersArr;
@property (nonatomic,strong) NSMutableArray *data;

@end

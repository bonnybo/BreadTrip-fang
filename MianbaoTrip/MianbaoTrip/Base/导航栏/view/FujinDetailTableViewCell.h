//
//  FujinDetailTableViewCell.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FujinModel.h"

@interface FujinDetailTableViewCell : UITableViewCell
{
    StarView *_starView;
}

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *commentLabel;

@property (strong, nonatomic) IBOutlet UILabel *subTitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *goneLabel;

@property (strong, nonatomic) IBOutlet UIImageView *bgImgView;

@property (nonatomic,strong) FujinModel *placeModel;


@end

//
//  NormallYoujiTableViewCell.h
//  MianbaoTrip
//
//  Created by Mac on 15-9-30.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YoujiModel.h"

@interface NormallYoujiTableViewCell : UITableViewCell
{
    
    IBOutlet UIImageView *imgView;
 
  
    IBOutlet UILabel *titleLabel;
  
    IBOutlet UILabel *timeLabel;
    
    
    IBOutlet UILabel *cityLabel;
    
    
    IBOutlet UIImageView *barView;
    IBOutlet UIImageView *userImgView;
    
    IBOutlet UILabel *userNameLabel;
}

//@property (nonatomic,strong) NSDictionary *data;
@property (nonatomic,strong) YoujiModel *model;

@end

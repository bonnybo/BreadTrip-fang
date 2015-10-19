//
//  DetailTBFooterView.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-6.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface DetailTBFooterView : UIView
{
    
    IBOutlet UILabel *sourceLabel;
    
    IBOutlet UILabel *timeLabel;
    
    
    IBOutlet UILabel *likeCountLabel;
    

    
    IBOutlet UILabel *commitCountLabel;
    
    
}
@property (nonatomic,strong) NSArray *data;

@end

//
//  DetaiStorelViewController.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "SecondBaseViewController.h"

@interface DetaiStorelViewController : SecondBaseViewController<UIScrollViewDelegate>

{
    
    IBOutlet UIImageView *bgImgView;
    
    IBOutlet UIImageView *personImgView;
    
    
    IBOutlet UILabel *commentLabel;
    
    IBOutlet UILabel *descriptionLabel;
    
}
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic,strong) NSNumber *place_id;
@property (nonatomic,assign) NSInteger comment_count;
@property (nonatomic,assign) CGFloat rating;
@property (nonatomic,copy) NSString *place_description;
@property (nonatomic,copy) NSString *name;
@end

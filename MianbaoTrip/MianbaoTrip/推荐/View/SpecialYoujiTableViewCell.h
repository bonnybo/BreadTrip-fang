//
//  SpecialYoujiTableViewCell.h
//  MianbaoTrip
//
//  Created by Mac on 15-9-30.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YoujiModel.h"
#import "Type5Model.h"
#import "Type7Model.h"
@interface SpecialYoujiTableViewCell : UITableViewCell

{
    IBOutlet UILabel *_titleLabel;
    
    IBOutlet UILabel *_subTitleLabel;
    
}

@property (strong, nonatomic) IBOutlet UIImageView *imgView;




//@property (nonatomic,strong) NSDictionary *data;
@property (nonatomic,assign) NSInteger typeNum;

@property (nonatomic,strong) Type5Model *type5Model;
@property (nonatomic,strong) Type7Model *type7Model;
@end

//
//  StoryDetailListModel.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-6.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseModel.h"

@interface StoryDetailListModel : BaseModel

@property (nonatomic,strong) NSNumber *photo_width;
@property (nonatomic,copy) NSString *photo_date_created;
@property (nonatomic,copy) NSString *photo_s;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *photo_1600;
@property (nonatomic,copy) NSString *timezone;
@property (nonatomic,copy) NSString *photo_w640;
@property (nonatomic,strong) NSNumber *detail_id;
@property (nonatomic,strong) NSDictionary *location;
@property (nonatomic,copy) NSString *photo;
@property (nonatomic,strong) NSNumber *type;
@property (nonatomic,strong) NSNumber *photo_height;



@end

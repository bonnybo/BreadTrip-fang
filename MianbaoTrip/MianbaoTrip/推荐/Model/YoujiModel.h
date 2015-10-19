//
//  YoujiModel.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseModel.h"
#import "UserModel.h"
@interface YoujiModel : BaseModel

@property (nonatomic,copy) NSString *cover_image_default;
@property (nonatomic,copy) NSString *waypoints;
@property (nonatomic,copy) NSString *last_day;
@property (nonatomic,strong) NSNumber *youji_id;
@property (nonatomic,copy) NSString *view_count;
@property (nonatomic,copy) NSString *day_count;
@property (nonatomic,copy) NSString *index_title;
@property (nonatomic,copy) NSString *comment_count;
@property (nonatomic,copy) NSString *mileage;
@property (nonatomic,copy) NSString *last_modified;
@property (nonatomic,copy) NSString *youji_description;
@property (nonatomic,strong) NSDictionary *user;
@property (nonatomic,copy) NSString *popular_place_str;
@property (nonatomic,copy) NSString *date_complete;
@property (nonatomic,strong) NSNumber *device;
@property (nonatomic,strong) NSNumber *date_added;
@property (nonatomic,copy) NSString *cover_image_w640;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) NSDictionary *start_point;
@property (nonatomic,copy) NSString *cover_image_1600;
@property (nonatomic,copy) NSString *summary;
@property (nonatomic,assign) BOOL is_hot_trip;
@property (nonatomic,strong) NSNumber *recommendations;
@property (nonatomic,copy) NSString *cover_image;
@property (nonatomic,copy) NSString *first_day;
@property (nonatomic,strong) UserModel *userModel;

@end

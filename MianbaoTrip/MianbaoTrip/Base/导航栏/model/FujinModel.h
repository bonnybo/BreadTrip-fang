//
//  FujinModel.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-7.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseModel.h"

@interface FujinModel : BaseModel

@property (nonatomic,copy) NSString *cover;
@property (nonatomic,copy) NSString *place_description;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) NSNumber *popularity;
@property (nonatomic,strong) NSNumber *comments_count;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,strong) NSNumber *place_id;
@property (nonatomic,strong) NSNumber *visited_count;
@property (nonatomic,strong) NSNumber *wish_to_go_count;
@property (nonatomic,strong) NSNumber *distance;
@property (nonatomic,strong) NSNumber *rating;
@property (nonatomic,strong) NSNumber *rating_users;
@property (nonatomic,strong) NSNumber *tips_count;
@end

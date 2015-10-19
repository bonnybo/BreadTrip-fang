//
//  MainStoryModel.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseModel.h"

@interface MainStoryModel : BaseModel

@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *index_cover;
@property (nonatomic,strong) id poi;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *trip_id;
@property (nonatomic,copy) NSString *index_title;
@property (nonatomic,copy) NSString *view_count;
@property (nonatomic,copy) NSString *location_alias;
@property (nonatomic,copy) NSString *cover_image_s;
@property (nonatomic,copy) NSString *share_url;
@property (nonatomic,strong) NSDictionary *user;
@property (nonatomic,copy) NSString *spot_id;
@property (nonatomic,copy) NSString *comments_count;
@property (nonatomic,copy) NSString *cover_image;
@property (nonatomic,copy) NSString *recommendations_count;


@end

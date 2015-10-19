//
//  UserModel.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-5.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "BaseModel.h"

@interface UserModel : BaseModel


@property (nonatomic,copy) NSString *location_name;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *resident_city_id;
@property (nonatomic,copy) NSString *gender;
@property (nonatomic,copy) NSString *avatar_m;
@property (nonatomic,copy) NSString *cover;
@property (nonatomic,copy) NSString *custom_url;
@property (nonatomic,copy) NSString *user_id;
@property (nonatomic,copy) NSString *birthday;
@property (nonatomic,copy) NSString *country_num;
@property (nonatomic,copy) NSString *avatar_s;
@property (nonatomic,copy) NSString *avatar_l;
@property (nonatomic,copy) NSString *country_code;
@property (nonatomic,copy) NSString *email;
@property (nonatomic,copy) NSString *user_desc;


@end

//
//  HotListModel.h
//  MianbaoTrip
//
//  Created by Mac on 15-10-4.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotListModel : BaseModel

@property (nonatomic,copy) NSString *index_cover;
@property (nonatomic,copy) NSString *index_title;
@property (nonatomic,copy) NSString *share_url;
@property (nonatomic,copy) NSString *date_tour;
@property (nonatomic,strong) NSDictionary *user;
@property (nonatomic,copy) NSString *spot_id;
@property (nonatomic,copy) NSString *cover_image_w640;
@property (nonatomic,copy) NSNumber *comments_count;
@property (nonatomic,copy) NSString *recommendations_count;
@property (nonatomic,copy) NSString *cover_image;
@property (nonatomic,copy) NSString *location_alias;
@property (nonatomic,strong) id poi;


@end

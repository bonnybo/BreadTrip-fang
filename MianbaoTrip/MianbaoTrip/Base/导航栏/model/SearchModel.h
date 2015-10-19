//
//  SearchModel.h
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchModel : BaseModel


@property (nonatomic,copy) NSString *rating;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *wish_to_go_count;
@property (nonatomic,copy) NSString *visited_count;
@property (nonatomic,copy) NSString *comments_count;
@property (nonatomic,strong) NSDictionary *location;
@property (nonatomic,assign) BOOL has_experience;
@property (nonatomic,copy) NSString *rating_users;
@property (nonatomic,copy) NSString *slug_url;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *nameId;
@property (nonatomic,assign) BOOL has_route_maps;
@property (nonatomic,copy) NSString *icon;



@end

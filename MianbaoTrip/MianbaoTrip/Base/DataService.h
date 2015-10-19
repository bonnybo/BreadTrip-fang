//
//  DataService.h
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "AFNetworking.h"


typedef void(^FinishDidBlock)(AFHTTPRequestOperation *operation,id result);
typedef void(^FailureBlock)(AFHTTPRequestOperation *operation,NSError *error);



@interface DataService : NSObject




+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)url
                                    params:(NSMutableDictionary *)params
                                httpMethod:(NSString *)httpMethod
                            finishDidBlock:(FinishDidBlock)finishDidBlock
                              failuerBlock:(FailureBlock)failureBlock;



@end

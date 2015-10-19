//
//  DataService.m
//  MianbaoTrip
//
//  Created by Mac on 15-9-28.
//  Copyright (c) 2015年 mianbaotrip. All rights reserved.
//

#import "DataService.h"

#define BASE_URL @"http://api.breadtrip.com/"

@implementation DataService

+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)url
                                    params:(NSMutableDictionary *)params
                                httpMethod:(NSString *)httpMethod
                            finishDidBlock:(FinishDidBlock)finishDidBlock
                              failuerBlock:(FailureBlock)failureBlock
{
    if (params == nil) {
        params = [NSMutableDictionary dictionary];
    }
    
    NSMutableString *urlstr = [NSMutableString stringWithFormat:@"%@%@",BASE_URL,url];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    AFHTTPRequestOperation *operation = nil;
   
    if ([httpMethod isEqualToString:@"GET"]) {
        
        operation = [ manager  GET:urlstr
                        parameters:params
                           success:^(AFHTTPRequestOperation *operation, id responseObject) {
                              
                               NSLog(@"AF-请求成功");
                               if (finishDidBlock) {
                                   finishDidBlock(operation,responseObject);
                               }

                           } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                               NSLog(@"AF-请求失败");
                               if (failureBlock) {
                                   failureBlock(operation,error);
                               }
                           }];
        
        
    }else if ([httpMethod isEqualToString:@"POST"]){
     
        operation = [manager POST:urlstr
                       parameters:params
                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
                              NSLog(@"AF-发送成功");
                          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                              NSLog(@"AF-发送失败");
                          }];
        
        
        
    }
    operation.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    return operation;
}


@end

//
//  LHNetworking.h
//  LHNetWorking
//
//  Created by liuhang on 16/11/16.
//  Copyright © 2016年 刘航. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
typedef enum {
    Post = 0,
    Get  = 1
}request;
@interface LHNetworking : NSObject
+ (LHNetworking *)shareInstance;
- (void)requestWith:(request)requestWay URL:(NSString *)url parameters:(id)parameters progress:(void (^) (NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure;
@end

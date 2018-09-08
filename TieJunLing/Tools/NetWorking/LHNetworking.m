//
//  LHNetworking.m
//  LHNetWorking
//
//  Created by liuhang on 16/11/16.
//  Copyright © 2016年 刘航. All rights reserved.
//

#import "LHNetworking.h"

@interface LHNetworking ()
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@end
@implementation LHNetworking
//懒加载
- (AFHTTPSessionManager *)manager {
    if(_manager == nil) {
        _manager = [[AFHTTPSessionManager alloc] init];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    }
    return _manager;
}
//创建单例方法
+ (LHNetworking *)shareInstance {
    static LHNetworking *networkingManager = nil;
    static dispatch_once_t onceToken;
    if (networkingManager == nil) {
        dispatch_once(&onceToken, ^{
            networkingManager = [[self alloc]init];
        });
    }
    return networkingManager;
}
//请求方法
- (void)requestWith:(request)requestWay URL:(NSString *)url parameters:(id)parameters progress:(void (^) (NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    if (requestWay == Post) {
        [self.manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            if (progress) {
                progress(uploadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
    if (requestWay == Get) {
        [self.manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            if (progress) {
                progress(uploadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}
@end

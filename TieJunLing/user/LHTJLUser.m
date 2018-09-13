//
//  LHTJLUser.m
//  TieJunLing
//
//  Created by 大海 on 13/9/18.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHTJLUser.h"

@implementation LHTJLUser
+(instancetype)shared {
    static LHTJLUser *_user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _user = [[self alloc]init];
    });
    return _user;
}
@end

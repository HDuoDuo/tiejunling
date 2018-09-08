//
//  LHPopularizeModel.m
//  TieJunLing
//
//  Created by macbook on 2018/9/8.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHPopularizeModel.h"

@implementation LHPopularizeModel
+ (instancetype)setModelWithDict:(NSDictionary *)dict {
    LHPopularizeModel *model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"invitationCode"]) {
        self.invitationCode = [NSString stringWithFormat:@"邀请码：%@",value];
    }
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end

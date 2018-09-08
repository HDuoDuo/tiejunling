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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end

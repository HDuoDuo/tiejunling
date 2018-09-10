//
//  LHNounModel.m
//  TieJunLing
//
//  Created by macbook on 2018/9/10.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHNounModel.h"

@implementation LHNounModel
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    LHNounModel *model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end

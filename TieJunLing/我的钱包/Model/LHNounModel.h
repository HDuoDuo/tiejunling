//
//  LHNounModel.h
//  TieJunLing
//
//  Created by macbook on 2018/9/10.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHNounModel : NSObject
@property(nonatomic,assign)NSInteger coinNo;//交易金额
@property(nonatomic,copy)NSString *headImg;//用户头像
@property(nonatomic,copy)NSString *title;//交易名称
@property(nonatomic,copy)NSString *createDate;//交易时间
+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end

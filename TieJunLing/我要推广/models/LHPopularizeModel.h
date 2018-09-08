//
//  LHPopularizeModel.h
//  TieJunLing
//
//  Created by macbook on 2018/9/8.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHPopularizeModel : NSObject
@property(nonatomic,copy)NSString *headImg;//头像
@property(nonatomic,copy)NSString *QRcode;//二维码
@property(nonatomic,copy)NSString *nickName;//昵称
@property(nonatomic,copy)NSString *invitationCode;//邀请码

+ (instancetype)setModelWithDict:(NSDictionary *)dict;
@end

//
//  LHTeamModel.h
//  TieJunLing
//
//  Created by macbook on 2018/9/12.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHTeamModel : NSObject
@property(nonatomic,assign)NSInteger tuijian;//推荐
@property(nonatomic,assign)NSInteger ID;//ID
@property(nonatomic,copy)NSString *headImg;//用户头像
@property(nonatomic,copy)NSString *phone;//电话号码
@property(nonatomic,copy)NSString *nickName;//名称
@property(nonatomic,assign)NSInteger status;//会员状态

@end

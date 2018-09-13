//
//  LHTJLUser.h
//  TieJunLing
//
//  Created by 大海 on 13/9/18.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHTJLUser : NSObject
+(instancetype)shared;
@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *token;
@end

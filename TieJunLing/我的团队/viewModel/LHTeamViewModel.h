//
//  LHTeamViewModel.h
//  TieJunLing
//
//  Created by macbook on 2018/9/12.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHTeamViewModel : NSObject
- (void)lodData:(void (^)(NSInteger num))completion;

@property(nonatomic,strong)NSMutableArray *teamModelsArr;
@end

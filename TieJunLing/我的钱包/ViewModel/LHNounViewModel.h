//
//  LHNounViewModel.h
//  TieJunLing
//
//  Created by macbook on 2018/9/10.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHNounViewModel : NSObject
@property(nonatomic,strong)NSMutableArray *mArr;
- (void)loadData:(NSString *)status Date:(NSString *)createDate success:(void (^)(void))completion;
- (void)loadMoreData:(NSString *)status Date:(NSString *)createDate success:(void (^)(void))completion;
@end

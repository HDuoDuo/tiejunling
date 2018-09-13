//
//  LHNounViewModel.h
//  TieJunLing
//
//  Created by macbook on 2018/9/10.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHNounViewModel : NSObject
@property(nonatomic,strong)NSMutableArray *mArr;//奖金数据数组
@property(nonatomic,strong)NSDictionary *moneyDict;//余额字典
@property(nonatomic,strong)NSMutableArray *mWalletArr;//钱包数据数组
@property(nonatomic,assign)NSInteger currentPage;//当前页
@property(nonatomic,assign)NSInteger totalPage;//总页数
- (void)loadData:(NSString *)status Date:(NSString *)createDate success:(void (^)(void))completion;
- (void)loadMoreData:(NSString *)status Date:(NSString *)createDate success:(void (^)(void))completion;
- (void)getAccountLine:(void (^)(void))completion;
@end

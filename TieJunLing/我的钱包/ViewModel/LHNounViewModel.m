//
//  LHNounViewModel.m
//  TieJunLing
//
//  Created by macbook on 2018/9/10.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHNounViewModel.h"
#import "LHNounModel.h"
@implementation LHNounViewModel
-(instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}
- (void)loadData:(NSString *)status Date:(NSString *)createDate success:(void (^)(void))completion {
    [self.mArr removeAllObjects];
    [self.mWalletArr removeAllObjects];
    NSDictionary *parameter = @{@"uid":@"108",
                            @"token":@"f5a544f6d3e7cc24b6119a12a701bda6",
                            @"page":@"1",
                            @"pageSize":@"10",
                            @"status":@"1",
                            @"createDate":createDate,
                            };
    [[LHNetworking shareInstance]requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/my/MyCoinNoRecord" parameters:parameter progress:nil success:^(id response) {
        
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *code = (NSNumber *)jsonData[@"code"];
        NSInteger rCode = [code integerValue];
        if (rCode == 200) {
            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
            NSDictionary *dict = jsonData[@"data"];
            
            //记录页码  总页数
            self.currentPage = [(NSNumber *)jsonData[@"page"] integerValue];
            self.totalPage = [(NSNumber *)jsonData[@"totalPage"] integerValue];
            
            NSLog(@"%@",jsonData);
            NSArray *dictArr = dict[@"data"];
            for (NSDictionary *dict in dictArr) {
                LHNounModel *model = [LHNounModel modelWithDict:dict];
                if ([status isEqualToString:@"1"]) {
                    [self.mArr addObject:model];
                }
                if ([status isEqualToString:@"2"]) {
                    [self.mWalletArr addObject:model];
                }
                
            }
            if (completion) {
                completion();
            }
        }
        
    } failure:^(NSError *err) {
        NSLog(@"%@",@"请求失败");
    }];
}
- (void)loadMoreData:(NSString *)status Date:(NSString *)createDate success:(void (^)(void))completion {
    
    NSDictionary *parameter = @{@"uid":@"108",
                                @"token":@"f5a544f6d3e7cc24b6119a12a701bda6",
                                @"page":[NSString stringWithFormat:@"%ld",self.currentPage++],
                                @"pageSize":@"10",
                                @"status":@"1",
                                @"createDate":createDate,
                                };
    [[LHNetworking shareInstance]requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/my/MyCoinNoRecord" parameters:parameter progress:nil success:^(id response) {
        
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *code = (NSNumber *)jsonData[@"code"];
        NSInteger rCode = [code integerValue];
        if (rCode == 200) {
            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
            NSDictionary *dict = jsonData[@"data"];
            
            //记录页码  总页数
            self.currentPage = [(NSNumber *)jsonData[@"page"] integerValue];
            self.totalPage = [(NSNumber *)jsonData[@"totalPage"] integerValue];
            
            NSLog(@"%@",jsonData);
            NSArray *dictArr = dict[@"data"];
            for (NSDictionary *dict in dictArr) {
                LHNounModel *model = [LHNounModel modelWithDict:dict];
                if ([status isEqualToString:@"1"]) {
                    [self.mArr addObject:model];
                }
                if ([status isEqualToString:@"2"]) {
                    [self.mWalletArr addObject:model];
                }
            }
            if (completion) {
                completion();
            }
        }
        
    } failure:^(NSError *err) {
        NSLog(@"%@",@"请求失败");
    }];
}
//获取账户余额
- (void)getAccountLine:(void (^)(void))completion {
    NSDictionary *parameter = @{@"uid":@"108",
                             @"token":@"f5a544f6d3e7cc24b6119a12a701bda6",
                                };
    [[LHNetworking shareInstance]requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/my/totalPrice" parameters:parameter progress:nil success:^(id response) {
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *code = (NSNumber *)jsonData[@"code"];
        NSInteger rCode = [code integerValue];
        if (rCode == 200) {
            NSDictionary *rDict = jsonData[@"data"];
            NSNumber *wallet = rDict[@"wallet"];
            NSNumber *bonus = rDict[@"bonus"];
            self.moneyDict = @{@"bonus":bonus,
                               @"wallet":wallet
                               };
            if (completion) {
                completion();
            }
        }
    } failure:^(NSError *err) {
        NSLog(@"%@",@"请求失败");
    }];
}
- (NSMutableArray *)mArr {
    if (!_mArr) {
        _mArr = [NSMutableArray array];
    }
    return _mArr;
}
- (NSMutableArray *)mWalletArr {
    if (!_mWalletArr) {
        _mWalletArr = [NSMutableArray array];
    }
    return _mWalletArr;
}
@end

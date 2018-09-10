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
- (void)loadData:(NSString *)status Date:(NSString *)createDate success:(void (^)(void))completion {
    NSDictionary *parameter = @{@"uid":@"108",
                                @"token":@"f5a544f6d3e7cc24b6119a12a701bda6",
                                @"page":@"1",
                                @"pageSize":@"3",
                                @"status":@"1",
                                @"createDate":createDate,
                                };
    [[LHNetworking shareInstance]requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/my/MyCoinNoRecord" parameters:parameter progress:nil success:^(id response) {
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSDictionary *dict = jsonData[@"data"];
        NSArray *dictArr = dict[@"data"];
        for (NSDictionary *dict in dictArr) {
            LHNounModel *model = [LHNounModel modelWithDict:dict];
            [self.mArr addObject:model];
        }
        if (completion) {
            completion();
        }
    } failure:^(NSError *err) {
        NSLog(@"%@",@"请求失败");
    }];
}
- (void)loadMoreData:(NSString *)status Date:(NSString *)createDate success:(void (^)(void))completion {
    
}
- (NSMutableArray *)mArr {
    if (!_mArr) {
        _mArr = [NSMutableArray array];
    }
    return _mArr;
}
@end

//
//  LHTeamViewModel.m
//  TieJunLing
//
//  Created by macbook on 2018/9/12.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHTeamViewModel.h"
#import "LHTeamModel.h"
@implementation LHTeamViewModel

- (void)lodData:(void (^)(NSInteger))completion {
    NSDictionary *parameter = @{@"uid":@"108",
                            @"token":@"f5a544f6d3e7cc24b6119a12a701bda6",
                            };
    [[LHNetworking shareInstance] requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/my/team" parameters:parameter progress:nil success:^(id response) {
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *code = (NSNumber *)jsonData[@"code"];
        NSInteger rCode = [code integerValue];
        if (rCode == 200) {
            NSDictionary *rDict = jsonData[@"data"];
            NSArray *arr = rDict[@"result"];
            NSLog(@"%@",jsonData);
            for (NSDictionary *dict in arr) {
              LHTeamModel *model = [[LHTeamModel alloc]init];
              model.tuijian = [(NSNumber *)dict[@"tuijian"] integerValue];
              model.headImg = dict[@"headImg"];
              model.phone = dict[@"phone"];
              model.nickName = dict[@"nickName"];
              model.ID = [(NSNumber *)dict[@"id"] integerValue];
              model.status = [(NSNumber *)dict[@"status"] integerValue];
              [self.teamModelsArr addObject:model];
            }
            if (completion) {
                completion([(NSNumber *)rDict[@"num"] integerValue]);
            }
        }
    } failure:^(NSError *err) {
        NSLog(@"%@",@"请求失败");
    }];
}
- (NSMutableArray *)teamModelsArr {
    if (!_teamModelsArr) {
        _teamModelsArr = [NSMutableArray array];
    }
    return _teamModelsArr;
}
@end

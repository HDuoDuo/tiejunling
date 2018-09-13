//
//  LHPopularizeViewModel.m
//  TieJunLing
//
//  Created by macbook on 2018/9/8.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHPopularizeViewModel.h"

@implementation LHPopularizeViewModel

- (void)getPopularData:(void (^)(void))completion {
    NSDictionary *parameter = @{@"uid":@"108",
                                @"token":@"f5a544f6d3e7cc24b6119a12a701bda6"
                                };
    [[LHNetworking shareInstance]requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/my/find" parameters:parameter progress:nil success:^(id response) {
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *code = (NSNumber *)jsonData[@"code"];
        NSLog(@"%@",jsonData[@"msg"]);
        NSInteger rCode = [code integerValue];
        if (rCode == 200) {
            NSDictionary *dict = jsonData[@"data"];
            self.popularModel = [LHPopularizeModel setModelWithDict:dict];
            if (completion) {
                completion();
            }
        }
    } failure:^(NSError *err) {
        NSLog(@"%@",@"请求失败");
    }];
}
@end

//
//  LHTieViewModel.m
//  TieJunLing
//
//  Created by macbook on 2018/9/12.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHTieViewModel.h"
#import "LHTieModel.h"
@implementation LHTieViewModel
- (void)loadData:(void (^)(void))completion {
    
}
- (instancetype)init {
    if (self = [super init]) {
        LHTieModel *modelOne = [[LHTieModel alloc]init];
        modelOne.sectionSelected = false;
        [self.modelsArr addObject:modelOne];
        LHTieModel *modelTwo = [[LHTieModel alloc]init];
        modelTwo.sectionSelected = false;
        [self.modelsArr addObject:modelTwo];
    }
    return self;
}
- (NSMutableArray *)modelsArr {
    if (!_modelsArr) {
        _modelsArr = [NSMutableArray array];
    }
    return _modelsArr;
}
@end

//
//  LHTieViewModel.h
//  TieJunLing
//
//  Created by macbook on 2018/9/12.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHTieViewModel : NSObject
- (void)loadData:(void (^)(void))completion;
@property(nonatomic,strong)NSMutableArray *modelsArr;
@end

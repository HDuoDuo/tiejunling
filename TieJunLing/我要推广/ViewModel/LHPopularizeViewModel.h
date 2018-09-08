//
//  LHPopularizeViewModel.h
//  TieJunLing
//
//  Created by macbook on 2018/9/8.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHPopularizeModel.h"
@interface LHPopularizeViewModel : NSObject
@property (nonatomic,strong)LHPopularizeModel *popularModel;
- (void)getPopularData:(void (^)(void))completion;
@end

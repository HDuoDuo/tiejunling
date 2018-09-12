//
//  WXsectionHeaderView.h
//  TieJunLing
//
//  Created by macbook on 2018/9/12.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHTieModel.h"
@interface WXsectionHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIButton *selectedBtn;
@property (nonatomic,copy)void(^BtnBlock)(BOOL isSeclected);
@property(nonatomic,strong)LHTieModel *model;
@end

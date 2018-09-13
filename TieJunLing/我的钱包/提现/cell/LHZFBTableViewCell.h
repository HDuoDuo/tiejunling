//
//  LHZFBTableViewCell.h
//  TieJunLing
//
//  Created by macbook on 2018/9/12.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHZFBTableViewCell.h"
//创建协议
@protocol celldDelegate <NSObject>
- (void)filterStr:(NSString *)filterStr; //声明协议方法
- (void)getFromServerFilter:(NSString *)filterStr;//服务器获取到的验证码
@end

@interface LHZFBTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *ZFBCountTF;
@property (weak, nonatomic) IBOutlet UITextField *ZFBNameTF;
@property (weak, nonatomic) IBOutlet UILabel *phoneTF;

@property (weak, nonatomic) IBOutlet UITextField *filterTF;
@property (weak, nonatomic) IBOutlet UIButton *sendFilterBtn;
@property(weak,nonatomic) id<celldDelegate> delegate;
@end

//
//  LHZFBTableViewCell.m
//  TieJunLing
//
//  Created by macbook on 2018/9/12.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHZFBTableViewCell.h"
#import "MJCountDownButton.h"
@implementation LHZFBTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.sendFilterBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.sendFilterBtn.layer.borderWidth = 1;
    self.sendFilterBtn.layer.cornerRadius = 6;
    self.sendFilterBtn.layer.masksToBounds = true;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)sendFilterBtnTap:(MJCountDownButton *)sender {
    
    [sender countDownFromTime:60 unitTitle:@"S" completion:^(MJCountDownButton *countDownButton) {
        
    }];
    NSDictionary *parameter = @{@"phone":self.phoneTF.text,
                                @"status":@"8",
                                };
    [[LHNetworking shareInstance]requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/user/sendCode" parameters:parameter progress:nil success:^(id response) {
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *code = (NSNumber *)jsonData[@"code"];
        NSInteger rCode = [code integerValue];
        if (rCode == 200) {
            NSString *filterNum = jsonData[@"data"];
            NSLog(@"%@",filterNum);
        }
    } failure:^(NSError *err) {
        NSLog(@"%@",@"请求失败");
    }];
}

@end

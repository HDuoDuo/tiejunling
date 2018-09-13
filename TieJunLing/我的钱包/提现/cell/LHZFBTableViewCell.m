//
//  LHZFBTableViewCell.m
//  TieJunLing
//
//  Created by macbook on 2018/9/12.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHZFBTableViewCell.h"
#import "MJCountDownButton.h"
@interface LHZFBTableViewCell()
@end
@implementation LHZFBTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.sendFilterBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.sendFilterBtn.layer.borderWidth = 1;
    self.sendFilterBtn.layer.cornerRadius = 6;
    self.sendFilterBtn.layer.masksToBounds = true;
    [self.filterTF addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
}

-(void)textChange:(UITextField *)theTextField{
    [self.delegate filterStr:theTextField.text];
}

- (void)loadData {
    NSDictionary *parameter = @{@"uid":@"108",
                                @"token":@"f5a544f6d3e7cc24b6119a12a701bda6",
                                };
    [[LHNetworking shareInstance]requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/my/phone" parameters:parameter progress:nil success:^(id response) {
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *code = (NSNumber *)jsonData[@"code"];
        NSInteger rCode = [code integerValue];
        if (rCode == 200) {
            NSString *filterNum = jsonData[@"data"];
            NSLog(@"%@",filterNum);
            self.phoneTF.text = filterNum;;
        }
    } failure:^(NSError *err) {
        NSLog(@"%@",@"请求失败");
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)sendFilterBtnTap:(MJCountDownButton *)sender {
    
    [sender countDownFromTime:60 unitTitle:@"S" completion:^(MJCountDownButton *countDownButton) {
        [countDownButton setTitle:@"重新发送" forState:UIControlStateNormal];
    }];
    if (self.phoneTF.text.length > 0) {
#warning 修改手机号不为自己的
        NSDictionary *parameter = @{@"phone":@"17723613880",
                                @"status":@"8",
                                    };
        [[LHNetworking shareInstance]requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/user/sendCode" parameters:parameter progress:nil success:^(id response) {
            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
            NSNumber *code = (NSNumber *)jsonData[@"code"];
            NSInteger rCode = [code integerValue];
            if (rCode == 200) {
                NSString *filterNum = jsonData[@"data"];
                [self.delegate getFromServerFilter:filterNum];
                NSLog(@"%@",filterNum);
            }
        } failure:^(NSError *err) {
            NSLog(@"%@",@"请求失败");
        }];
    }
    
}
@end

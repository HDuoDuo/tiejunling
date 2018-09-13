//
//  LHOutMoneyViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/10.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHOutMoneyViewController.h"

@interface LHOutMoneyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UITextField *outMoneyTF;

@end

@implementation LHOutMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)moneyTF:(UITextField *)sender {
}
- (IBAction)leftTap:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:true];
}
- (IBAction)rightTap:(UIButton *)sender {
}

- (IBAction)submitBtnTap:(UIButton *)sender {
    NSDictionary *parameter = @{@"uid":@"108",
                            @"token":@"f5a544f6d3e7cc24b6119a12a701bda6",
                            @"coinNo":self.outMoneyTF.text,
                            };
    [[LHNetworking shareInstance]requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/my/insert" parameters:parameter progress:nil success:^(id response) {
        
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *code = (NSNumber *)jsonData[@"code"];
        NSInteger rCode = [code integerValue];
        NSLog(@"%@",jsonData);
        NSLog(@"%@",jsonData[@"msg"]);
        if (rCode == 200) {
            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
            NSString *msgStr = jsonData[@"data"];
            
        }
        
    } failure:^(NSError *err) {
        NSLog(@"%@",@"请求失败");
    }];
}


@end

//
//  LHMemberViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/7.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHMemberViewController.h"
#import "LHPayViewController.h"
@interface LHMemberViewController ()

@end

@implementation LHMemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = true;
}
- (IBAction)backTap:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:true];
}
- (IBAction)upGrade:(UIButton *)sender {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"您还未绑定邀请人" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入邀请码";
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (alertVC.textFields.firstObject.text.length == 8) {//邀请码
            
            
        }else {
            NSLog(@"邀请码错误");
        }
        
    }];
    [alertVC addAction:cancelAction];
    [alertVC addAction:sureAction];
    [self presentViewController:alertVC animated:true completion:nil];
    
   
}

- (void)uploadInviteNum:(NSString *)num {
    NSDictionary *parameter = @{@"uid":@"108",
                             @"invitationCode":num,
                             @"token":@"f5a544f6d3e7cc24b6119a12a701bda6",
                            };
    [[LHNetworking shareInstance] requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/my/updateCID" parameters:parameter progress:nil success:^(id response) {
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *code = (NSNumber *)jsonData[@"code"];
        NSInteger rCode = [code integerValue];
        if (rCode == 200) {
#warning 需要测试
            LHPayViewController *payVC = [[LHPayViewController alloc]init];
            [self.navigationController pushViewController:payVC animated:true];
        }else {
            
        }
    } failure:^(NSError *err) {
        NSLog(@"%@",@"请求失败");
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = true;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

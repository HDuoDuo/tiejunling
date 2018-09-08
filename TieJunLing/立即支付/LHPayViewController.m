//
//  LHPayViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/8.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHPayViewController.h"

@interface LHPayViewController ()
@property (weak, nonatomic) IBOutlet UIButton *weiXinBtn;
@property (weak, nonatomic) IBOutlet UIButton *zhifubaoBtn;
@property(nonatomic,assign)BOOL isWeiXin;
@end

@implementation LHPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden = false;
    [self createNavLeftItem:@"backBtn" rightItem:nil];
    self.title = @"立即支付";
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.isWeiXin = true;
    self.weiXinBtn.selected = self.isWeiXin;
}


- (IBAction)sureTap:(UIButton *)sender {
    if (self.isWeiXin) {
        //调起微信支付
        [self weixinzhifu];
    }else {
        NSLog(@"不是微信");
    }
}
- (void)weixinzhifu {//请求订单
    NSDictionary *parameter = @{@"uid":@"108",
                             @"token":@"f5a544f6d3e7cc24b6119a12a701bda6"
                            };
    [[LHNetworking shareInstance]requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/pay/wxpay" parameters:parameter progress:nil success:^(id response) {
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSDictionary *dict = jsonData[@"data"];
        
    } failure:^(NSError *err) {
        
    }];
}
- (IBAction)zhifubaoTap:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.weiXinBtn.selected = !sender.selected;
    self.isWeiXin = self.weiXinBtn.selected;
}
- (IBAction)weinxinTap:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.zhifubaoBtn.selected = !sender.selected;
    self.isWeiXin = sender.selected;
}
-(void)leftItemTap:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:true];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

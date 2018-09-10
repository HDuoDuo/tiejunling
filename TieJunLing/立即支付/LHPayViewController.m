//
//  LHPayViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/8.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHPayViewController.h"
#import <WXApi.h>
@interface LHPayViewController ()<WXApiDelegate>
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
        NSNumber *code = (NSNumber *)jsonData[@"code"];
        NSInteger rCode = [code integerValue];
        NSDictionary *dataDict = jsonData[@"data"];
        if (rCode == 200) {
            //发起支付
            PayReq *req = [[PayReq alloc] init];
            req.partnerId = dataDict[@"mch_id"];
            req.prepayId= dataDict[@"prepay_id"];
            req.package = dataDict[@"package"];
            req.nonceStr= dataDict[@"nonce_str"];
            req.timeStamp= (uint32_t)dataDict[@"timestamp"];
            req.sign= dataDict[@"sign"];
            [WXApi sendReq:req];
        }
    } failure:^(NSError *err) {
        NSLog(@"请求失败");
    }];
}
//支付回调
- (void)onReq:(BaseReq *)req {
    
}
- (void)onResp:(BaseResp *)resp {
    NSLog(@"%d",resp.errCode);
    if ([resp isKindOfClass:[PayResp class]]){
        PayResp*response=(PayResp*)resp;
        switch(response.errCode){
            case WXSuccess:
                //服务器端查询支付通知或查询API返回的结果再提示成功
                NSLog(@"支付成功");
                break;
            default:
                NSLog(@"支付失败，retcode=%d",resp.errCode);
                break;
        }
    }
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

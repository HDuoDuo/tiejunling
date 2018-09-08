//
//  LHPopularizeViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/7.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHPopularizeViewController.h"
#import "LHPopularizeViewModel.h"
#import <UIImageView+WebCache.h>
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
@interface LHPopularizeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *userNickName;
@property (weak, nonatomic) IBOutlet UILabel *inviteNum;
@property (weak, nonatomic) IBOutlet UIImageView *inviteImage;
@property (weak, nonatomic) IBOutlet UIView *secondBackgroundView;

@property(nonatomic,strong)LHPopularizeViewModel *popViewModel;

@end

@implementation LHPopularizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.secondBackgroundView.layer.masksToBounds = true;
    self.secondBackgroundView.layer.cornerRadius = 15;
    self.iconImage.layer.masksToBounds = true;
    self.iconImage.layer.cornerRadius = 45;
    self.popViewModel = [[LHPopularizeViewModel alloc]init];
    __weak typeof(self) weakSelf = self;
    [self.popViewModel getPopularData:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf createUI];
        });
    }];
}
- (void)createUI {
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:self.popViewModel.popularModel.headImg]];
    [self.inviteImage sd_setImageWithURL:[NSURL URLWithString:self.popViewModel.popularModel.QRcode]];
    self.userNickName.text = self.popViewModel.popularModel.nickName;
    self.inviteNum.text = self.popViewModel.popularModel.invitationCode;
}
- (IBAction)backBtnTap:(UIButton *)sender {//返回
    [self.navigationController popViewControllerAnimated:true];
}
- (IBAction)shareBtnTap:(UIButton *)sender {//分享
    NSArray* imageArray = @[[UIImage imageNamed:@"Placehodericon.png"],[UIImage imageNamed:@"Placehodericon.png"]];
//    （注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传image参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        //有的平台要客户端分享需要加此方法，例如微博
        [shareParams SSDKEnableUseClientShare];
    
    [ShareSDK showShareActionSheet:nil customItems:nil shareParams:shareParams sheetConfiguration:nil onStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
        switch (state) {
            case SSDKResponseStateSuccess:
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                    message:nil
                                                                   delegate:nil
                                                          cancelButtonTitle:@"确定"
                                                          otherButtonTitles:nil];
                [alertView show];
                break;
            }
            case SSDKResponseStateFail:
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                message:[NSString stringWithFormat:@"%@",error]
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil, nil];
                [alert show];
                break;
            }
            default:
                break;
        }
    }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

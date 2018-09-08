//
//  LHPopularizeViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/7.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHPopularizeViewController.h"

@interface LHPopularizeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *userNickName;
@property (weak, nonatomic) IBOutlet UILabel *inviteNum;
@property (weak, nonatomic) IBOutlet UIImageView *inviteImage;
@property (weak, nonatomic) IBOutlet UIView *secondBackgroundView;

@end

@implementation LHPopularizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.secondBackgroundView.layer.masksToBounds = true;
    self.secondBackgroundView.layer.cornerRadius = 15;
}
- (IBAction)backBtnTap:(UIButton *)sender {//返回
    [self.navigationController popViewControllerAnimated:true];
}
- (IBAction)shareBtnTap:(UIButton *)sender {//分享
    
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

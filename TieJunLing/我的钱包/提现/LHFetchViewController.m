//
//  LHFetchViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/11.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHFetchViewController.h"

@interface LHFetchViewController ()
@property (weak, nonatomic) IBOutlet UILabel *canUseMoney;
@property (nonatomic,assign)BOOL isSeclectedWX;
@end

@implementation LHFetchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = false;
    [self createNavLeftItem:@"backBtn" rightItem:nil];
    self.title = @"提现";
    // Do any additional setup after loading the view from its nib.
}
- (void)leftItemTap:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:true];
}
- (IBAction)weixinChoiceTap:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)zhifubaoChoiceTap:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)moneyTF:(UITextField *)sender {
}
- (IBAction)submitBtnTap:(UIButton *)sender {
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

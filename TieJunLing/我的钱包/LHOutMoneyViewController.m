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
}


@end

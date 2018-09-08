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
    LHPayViewController *payVC = [[LHPayViewController alloc]init];
    
    [self.navigationController pushViewController:payVC animated:true];
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

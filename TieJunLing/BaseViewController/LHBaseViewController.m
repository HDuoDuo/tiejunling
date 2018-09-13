//
//  LHBaseViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/7.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHBaseViewController.h"

@interface LHBaseViewController ()

@end

@implementation LHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = true;

}
- (void)createNavLeftItem:(NSString *)leftImageName rightItem:(NSString *)rightImageName {
    if (leftImageName) {
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:leftImageName] style:UIBarButtonItemStylePlain target:self action:@selector(leftItemTap:)];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    if (rightImageName) {
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:rightImageName] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemTap:)];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
    
}
- (void)leftItemTap:(UIBarButtonItem *)sender {
    
}
- (void)rightItemTap:(UIBarButtonItem *)sender {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
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

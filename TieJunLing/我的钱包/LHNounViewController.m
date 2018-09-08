//
//  LHNounViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/8.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHNounViewController.h"

@interface LHNounViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation LHNounViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden = false;
    self.title = @"我的钱包";
    [self createNavLeftItem:@"backBtn" rightItem:nil];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
}
#pragma UITableViewDelegate,UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (void)leftItemTap:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:true];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)myNoun:(UIButton *)sender {
}
- (IBAction)myWallet:(UIButton *)sender {
}
- (IBAction)outMoney:(UIButton *)sender {
}



@end

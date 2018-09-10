//
//  LHNounViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/8.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHNounViewController.h"
#import "LHDetailTableViewCell.h"
#import "LHNounViewModel.h"
#import <QFDatePickerView.h>
#import "LHOutMoneyViewController.h"
static NSString *cellIdentifier = @"LHDetailTableViewCellIdentifier";
@interface LHNounViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,strong)LHNounViewModel *viewModel;
@property(nonatomic,strong)QFDatePickerView *datePickerView;
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
    [self.myTableView registerNib:[UINib nibWithNibName:@"LHDetailTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    self.viewModel = [[LHNounViewModel alloc]init];
    __weak typeof(self) weakSelf = self;
    self.datePickerView = [[QFDatePickerView alloc]initDatePackerWithResponse:^(NSString *dateStr) {
        __weak typeof(self) weakSelf = self;
        [weakSelf.viewModel loadData:nil Date:dateStr success:^{
            [weakSelf.myTableView reloadData];
        }];
    }];
    
    
}
#pragma UITableViewDelegate,UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LHDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.model = self.viewModel.mArr[indexPath.row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.mArr.count;
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
    LHOutMoneyViewController *outMoneyVC = [[LHOutMoneyViewController alloc]init];
    [self.navigationController pushViewController:outMoneyVC animated:true];
}
//时间选择器
- (IBAction)timePicker:(UIButton *)sender {
    [self.datePickerView show];
}



@end

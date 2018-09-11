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
#import "LHFetchViewController.h"
static NSString *cellIdentifier = @"LHDetailTableViewCellIdentifier";
@interface LHNounViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,strong)LHNounViewModel *viewModel;
@property(nonatomic,strong)QFDatePickerView *datePickerView;
@property(nonatomic,assign)BOOL isNounStatus;

@end

@implementation LHNounViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNounStatus = true;
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
    //时间选择器
    self.datePickerView = [[QFDatePickerView alloc]initDatePackerWithResponse:^(NSString *dateStr) {
        [weakSelf.viewModel loadData:nil Date:dateStr success:^{
            [weakSelf.myTableView reloadData];
        }];
    }];
   
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //余额设置
    [self.viewModel getAccountLine:^(NSInteger wallet,NSInteger bonus) {
        self.moneyLabel.text = [NSString stringWithFormat:@"%ld",wallet];
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
    self.isNounStatus = false;
}
- (IBAction)outMoney:(UIButton *)sender {
    //判断当前状态是否奖金页面
    if (self.isNounStatus) {//奖金页面
        LHOutMoneyViewController *outMoneyVC = [[LHOutMoneyViewController alloc]init];
        [self.navigationController pushViewController:outMoneyVC animated:true];
    }else {//钱包页面
        LHFetchViewController *fetchVC = [[LHFetchViewController alloc]init];
        fetchVC.canUseLine = @"";
        [self.navigationController pushViewController:fetchVC animated:true];
    }
}
//时间选择器
- (IBAction)timePicker:(UIButton *)sender {
    [self.datePickerView show];
}



@end

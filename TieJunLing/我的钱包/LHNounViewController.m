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
@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;
@property (weak, nonatomic) IBOutlet UIButton *outMoneyBtn;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property(nonatomic,copy)NSString *currentDate;//当前日期
@property(nonatomic,copy)NSString *choiceDate;//选择的日期
@end

@implementation LHNounViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNounStatus = true;
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的钱包";
    [self createNavLeftItem:@"backBtn" rightItem:nil];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [self.timeButton setTitle:self.currentDate forState:UIControlStateNormal];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView registerNib:[UINib nibWithNibName:@"LHDetailTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    self.viewModel = [[LHNounViewModel alloc]init];
    __weak typeof(self) weakSelf = self;
    //时间选择器
    self.datePickerView = [[QFDatePickerView alloc]initDatePackerWithResponse:^(NSString *dateStr) {
        weakSelf.choiceDate = dateStr;
        [weakSelf.timeButton setTitle:dateStr forState:UIControlStateNormal];
        [weakSelf loadData:dateStr];
    }];
    //下拉刷新
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
          [weakSelf loadData:weakSelf.timeButton.currentTitle];
    }];
    //上拉加载
    self.myTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData:weakSelf.choiceDate];
    }];
    
    [self.myTableView.mj_header beginRefreshing];
}
- (void)checkNoMoreData {
    if (self.viewModel.totalPage == self.viewModel.currentPage) {
        [self.myTableView.mj_footer endRefreshingWithNoMoreData];
    }
}
- (void)loadData:(NSString *)dateStr {
    __weak typeof(self) weakSelf = self;
    if (self.isNounStatus) {
        [weakSelf.viewModel loadData:@"1" Date:dateStr success:^{
            [weakSelf.myTableView.mj_header endRefreshing];
            [weakSelf.myTableView reloadData];
            
        }];
    }else {
        [weakSelf.viewModel loadData:@"2" Date:dateStr success:^{
            [weakSelf.myTableView.mj_header endRefreshing];
            [weakSelf.myTableView reloadData];
        }];
    }
}
- (void)loadMoreData:(NSString *)dateStr {
    __weak typeof(self) weakSelf = self;
    if (self.isNounStatus) {
        [weakSelf .viewModel loadMoreData:@"1" Date:dateStr success:^{
            [weakSelf.myTableView.mj_footer endRefreshing];
            [weakSelf.myTableView reloadData];
        }];
    }else {
        [weakSelf .viewModel loadMoreData:@"2" Date:dateStr success:^{
            [weakSelf.myTableView.mj_footer endRefreshing];
            [weakSelf.myTableView reloadData];
        }];
    }
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //余额设置
    __weak typeof(self) weakSelf = self;
    [self.viewModel getAccountLine:^{
        [weakSelf updateMoneyLabel];
    }];
}
#pragma UITableViewDelegate,UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LHDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (self.isNounStatus) {
        cell.model = self.viewModel.mArr[indexPath.row];
    }else {
        cell.model = self.viewModel.mWalletArr[indexPath.row];
    }
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.isNounStatus ? self.viewModel.mArr.count : self.viewModel.mWalletArr.count;
}
- (void)leftItemTap:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:true];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)myNoun:(UIButton *)sender {
    self.indicatorLabel.center = CGPointMake(sender.center.x, self.indicatorLabel.center.y);
    self.isNounStatus = true;
}
- (IBAction)myWallet:(UIButton *)sender {
    self.indicatorLabel.center = CGPointMake(sender.center.x, self.indicatorLabel.center.y);
    self.isNounStatus = false;
}
//  更新界面状态
- (void)updateUIStatus {
    //更新moneyLabel
    [self updateMoneyLabel];
    if (self.isNounStatus) {//奖金
        [self.outMoneyBtn setTitle:@"转出" forState:UIControlStateNormal];
        self.detailLabel.text = @"奖金明细";
    }else {//钱包
        [self.outMoneyBtn setTitle:@"提现" forState:UIControlStateNormal];
        self.detailLabel.text = @"钱包明细";
    }
    //数据更新
    [self loadData:self.timeButton.currentTitle];//进入界面时请求一次
}
//刷新余额
-(void)updateMoneyLabel {
    if (self.isNounStatus) {
        self.moneyLabel.text = [NSString stringWithFormat:@"%ld",[self.viewModel.moneyDict[@"bonus"] integerValue]];
    }else {
        self.moneyLabel.text = [NSString stringWithFormat:@"%ld",[self.viewModel.moneyDict[@"wallet"] integerValue]];
    }
}
- (void)setIsNounStatus:(BOOL)isNounStatus {
    _isNounStatus = isNounStatus;
    [self updateUIStatus];
}
- (IBAction)outMoney:(UIButton *)sender {
    //判断当前状态是否奖金页面
    if (self.isNounStatus) {//奖金页面
        LHOutMoneyViewController *outMoneyVC = [[LHOutMoneyViewController alloc]init];
        [self.navigationController pushViewController:outMoneyVC animated:true];
    }else {//钱包页面
        LHFetchViewController *fetchVC = [[LHFetchViewController alloc]init];
        fetchVC.canUseLine = @"500";
        [self.navigationController pushViewController:fetchVC animated:true];
    }
}
//时间选择器
- (IBAction)timePicker:(UIButton *)sender {
    [self.datePickerView show];
}
- (NSString *)currentDate {
    if (!_currentDate) {
        NSDate *date=[NSDate date];
        NSDateFormatter *format1=[[NSDateFormatter alloc] init];
        [format1 setDateFormat:@"yyyy-MM"];
        NSString *dateStr;
        dateStr=[format1 stringFromDate:date];
        _currentDate = dateStr;
    }
    return _currentDate;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = false;
}
@end

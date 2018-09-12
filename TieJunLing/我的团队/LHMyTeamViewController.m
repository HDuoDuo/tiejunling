//
//  LHMyTeamViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/11.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHMyTeamViewController.h"
#import "LHTeamTableViewCell.h"
#import "LHTeamMemberTableViewCell.h"//all
#import "LHTeamViewModel.h"
#import "LHAllTableViewCell.h"//ling
#import "LHTeamModel.h"
static NSString *cellIdentifierling = @"LHAllTableViewCell";//ling
static NSString *cellIdentifierall = @"LHTeamMemberTableViewCell";//all
@interface LHMyTeamViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,strong)LHTeamViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@end

@implementation LHMyTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = false;
    [self createNavLeftItem:@"backBtn" rightItem:nil];
    self.title = @"我的团队";
    //注册
    [self.myTableView registerNib:[UINib nibWithNibName:@"LHTeamMemberTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifierall];//all
    self.myTableView.rowHeight = 80;
    
    __weak typeof(self) weakSelf = self;
    [self.viewModel lodData:^(NSInteger num) {
        weakSelf.numLabel.text = [NSString stringWithFormat:@"%ld",num];
        [weakSelf.myTableView reloadData];
    }];
}

#pragma UITableViewDelegate,UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   LHTeamModel *model = self.viewModel.teamModelsArr[indexPath.row];
   LHTeamMemberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierall forIndexPath:indexPath];
   cell.model = model;
    NSLog(@"%ld",model.tuijian);
   return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.teamModelsArr.count > 0 ? self.viewModel.teamModelsArr.count : 0;
}
- (void)leftItemTap:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (LHTeamViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[LHTeamViewModel alloc]init];
    }
    return _viewModel;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

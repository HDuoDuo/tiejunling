//
//  LHFetchViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/11.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHFetchViewController.h"
#import "LHZFBTableViewCell.h"
#import "WXsectionHeaderView.h"
#import "ZFBsectionHeaderView.h"
#import "LHTieViewModel.h"
static NSString *cellIdentifierWX = @"LHTieTableViewCell";
static NSString *cellIdentfierZFB = @"LHZFBTableViewCell";
@interface LHFetchViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,assign)BOOL isWX;
@property(nonatomic,assign)BOOL isZFB;
@property(nonatomic,strong)LHTieViewModel *viewModel;
@end

@implementation LHFetchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = false;
    [self createNavLeftItem:@"backBtn" rightItem:nil];
    self.title = @"提现";
    
    [self initUI];
    
}
- (void)initUI {
//    UIView *headerView = [[NSBundle mainBundle]loadNibNamed:@"headerView" owner:nil options:nil].firstObject;
//    self.myTableView.tableHeaderView = headerView;
    UIView *footerView = [[NSBundle mainBundle]loadNibNamed:@"footerView" owner:nil options:nil].firstObject;
    self.myTableView.tableFooterView = footerView;
    self.myTableView.allowsSelection = false;
    //注册
    [self.myTableView registerNib:[UINib nibWithNibName:@"LHZFBTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentfierZFB];
}
- (void)loadData {
    NSDictionary *parameter = @{@"uid":@"108",
                            @"token":@"f5a544f6d3e7cc24b6119a12a701bda6",
                            };
    [[LHNetworking shareInstance]requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/my/phone" parameters:parameter progress:nil success:^(id response) {
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *code = (NSNumber *)jsonData[@"code"];
        NSInteger rCode = [code integerValue];
        if (rCode == 200) {
            NSString *filterNum = jsonData[@"data"];
            NSLog(@"%@",filterNum);
            [self.myTableView reloadData];
        }
    } failure:^(NSError *err) {
        NSLog(@"%@",@"请求失败");
    }];
}
#pragma UITableViewDelegate,UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    LHZFBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentfierZFB forIndexPath:indexPath];

    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
        ZFBsectionHeaderView *sectionHeaderViewZFB = [[NSBundle mainBundle]loadNibNamed:@"ZFBsectionHeaderView" owner:nil options:nil].firstObject;
        return sectionHeaderViewZFB;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001f;
}
- (void)leftItemTap:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:true];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

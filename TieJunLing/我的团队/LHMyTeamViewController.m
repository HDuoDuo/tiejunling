//
//  LHMyTeamViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/11.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHMyTeamViewController.h"
#import "LHTeamTableViewCell.h"
#import "LHTeamMemberTableViewCell.h"
static NSString *cellIdentifier = @"myTeamCellIdentifier";
@interface LHMyTeamViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end

@implementation LHMyTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = false;
    [self createNavLeftItem:@"backBtn" rightItem:nil];
    self.title = @"我的团队";
    [self.myTableView registerNib:[UINib nibWithNibName:@"LHTeamMemberTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    self.myTableView.rowHeight = 80;
    
    
    NSDictionary *parameter = @{@"uid":@"108",
                            @"token":@"f5a544f6d3e7cc24b6119a12a701bda6",
                            };
    [[LHNetworking shareInstance] requestWith:Post URL:@"http://192.168.3.53:8081/app/controller/my/team" parameters:parameter progress:nil success:^(id response) {
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *code = (NSNumber *)jsonData[@"code"];
        NSInteger rCode = [code integerValue];
        if (rCode == 200) {
            NSDictionary *rDict = jsonData[@"data"];
            NSArray *dictArr = rDict[@"result"];
            NSLog(@"%ld",dictArr.count);
        }
    } failure:^(NSError *err) {
        
    }];
}

#pragma UITableViewDelegate,UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LHTeamMemberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (void)leftItemTap:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:true];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

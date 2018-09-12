//
//  LHTeamMemberTableViewCell.h
//  TieJunLing
//
//  Created by macbook on 2018/9/11.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHTeamModel.h"
@interface LHTeamMemberTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *jianTuiLabel;
@property(nonatomic,strong)LHTeamModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIImageView *memberIcon;
@end

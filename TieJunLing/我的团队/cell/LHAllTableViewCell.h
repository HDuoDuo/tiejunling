//
//  LHAllTableViewCell.h
//  TieJunLing
//
//  Created by macbook on 2018/9/11.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHTeamModel.h"
@interface LHAllTableViewCell : UITableViewCell
@property(nonatomic,strong)LHTeamModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;

@end

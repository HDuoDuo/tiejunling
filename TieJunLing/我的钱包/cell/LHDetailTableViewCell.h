//
//  LHDetailTableViewCell.h
//  TieJunLing
//
//  Created by macbook on 2018/9/8.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHNounModel.h"
@interface LHDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *TitileLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *MoneyLabel;

@property(nonatomic,strong)LHNounModel *model;
@end

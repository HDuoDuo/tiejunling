//
//  LHTeamTableViewCell.m
//  TieJunLing
//
//  Created by macbook on 2018/9/11.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHTeamTableViewCell.h"

@implementation LHTeamTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imageView.layer.cornerRadius = 31;
    self.imageView.layer.masksToBounds = true;
    self.imageView.layer.borderWidth = 10;
    self.imageView.layer.borderColor = [UIColor redColor].CGColor;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

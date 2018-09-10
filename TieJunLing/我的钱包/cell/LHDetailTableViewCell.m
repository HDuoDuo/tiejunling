//
//  LHDetailTableViewCell.m
//  TieJunLing
//
//  Created by macbook on 2018/9/8.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHDetailTableViewCell.h"

@implementation LHDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.userIcon.layer.cornerRadius = 19.5;
    self.userIcon.layer.masksToBounds = YES;
}
- (void)setModel:(LHNounModel *)model {
    _model = model;
    [self.userIcon sd_setImageWithURL:[NSURL URLWithString:_model.headImg]];
    self.TitileLabel.text = _model.title;
    self.timeLabel.text = _model.createDate;
    self.MoneyLabel.text = [NSString stringWithFormat:@"%ld",_model.coinNo];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

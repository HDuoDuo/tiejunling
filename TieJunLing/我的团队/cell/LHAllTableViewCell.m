//
//  LHAllTableViewCell.m
//  TieJunLing
//
//  Created by macbook on 2018/9/11.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHAllTableViewCell.h"

@implementation LHAllTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(LHTeamModel *)model {
    _model = model;
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:_model.headImg]];
    self.nickNameLabel.text = _model.nickName;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

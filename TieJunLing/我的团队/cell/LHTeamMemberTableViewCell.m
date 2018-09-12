//
//  LHTeamMemberTableViewCell.m
//  TieJunLing
//
//  Created by macbook on 2018/9/11.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHTeamMemberTableViewCell.h"

@implementation LHTeamMemberTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.jianTuiLabel.layer.borderColor = [UIColor redColor].CGColor;
    self.jianTuiLabel.layer.borderWidth = 1;
    self.jianTuiLabel.layer.cornerRadius = 3;
    self.jianTuiLabel.layer.masksToBounds = true;
}
- (void)setModel:(LHTeamModel *)model {
    _model = model;
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:_model.headImg]];
    self.nickNameLabel.text = _model.nickName;
    if (_model.tuijian == 1) {
        self.jianTuiLabel.text = @"直推";
    }else{
        self.jianTuiLabel.text = @"间推";
    }
    if (_model.status == 2) {//会员
        self.memberIcon.hidden = false;
    }else {//非会员
        self.memberIcon.hidden = true;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

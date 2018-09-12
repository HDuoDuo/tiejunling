//
//  WXsectionHeaderView.m
//  TieJunLing
//
//  Created by macbook on 2018/9/12.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "WXsectionHeaderView.h"

@implementation WXsectionHeaderView

- (IBAction)selectedBtnTap:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.BtnBlock) {
//        self.BtnBlock(sender.selected);
    }
}
- (void)setModel:(LHTieModel *)model {
    _model = model;
    self.selectedBtn.selected = _model.sectionSelected;
}
@end

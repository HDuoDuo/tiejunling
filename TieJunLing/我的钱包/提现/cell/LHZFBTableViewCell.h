//
//  LHZFBTableViewCell.h
//  TieJunLing
//
//  Created by macbook on 2018/9/12.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHZFBTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *ZFBCountTF;
@property (weak, nonatomic) IBOutlet UITextField *ZFBNameTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;

@property (weak, nonatomic) IBOutlet UITextField *filterTF;
@property (weak, nonatomic) IBOutlet UIButton *sendFilterBtn;

@end

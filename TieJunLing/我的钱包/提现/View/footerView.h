//
//  footerView.h
//  TieJunLing
//
//  Created by macbook on 2018/9/12.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface footerView : UIView
@property (weak, nonatomic) IBOutlet UILabel *canuseMoney;
@property (weak, nonatomic) IBOutlet UITextField *tixianNum;
@property(nonatomic,copy)void(^block)(UITextField *);
@end

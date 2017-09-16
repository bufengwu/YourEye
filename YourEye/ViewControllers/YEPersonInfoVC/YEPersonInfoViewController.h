//
//  YEPersonInfoViewController.h
//  YourEye
//
//  Created by DevKK on 2017/9/8.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YEPersonCellMode) {
    YEPersonCellLoginMode,
    YEPersonCellWatcherMode,
    YEPersonCellOwnerMode,
};

@interface YEPersonInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet UIImageView *avatarView;

@property (weak, nonatomic) IBOutlet UILabel *focusDescLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansDescLabel;
@property (weak, nonatomic) IBOutlet UIButton *fansNumBtn;
@property (weak, nonatomic) IBOutlet UIButton *focusNumBtn;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *signLabel;
@property (weak, nonatomic) IBOutlet UILabel *regionLabel;
@property (weak, nonatomic) IBOutlet UILabel *receivedLikeNum;

@property (weak, nonatomic) IBOutlet UIButton *focusBtn;
@property (weak, nonatomic) IBOutlet UIButton *sendMsgBtn;
@property (weak, nonatomic) IBOutlet UIButton *modifyBtn;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *regBtn;


@property (assign, nonatomic) YEPersonCellMode mode;

@end

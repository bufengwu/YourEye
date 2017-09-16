//
//  YEPersonInfoViewController.m
//  YourEye
//
//  Created by DevKK on 2017/9/8.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "YEPersonInfoViewController.h"

#import "YEModifyPersonInfoViewController.h"
#import "YELoginViewController.h"
#import "YERegViewController.h"

#import "YEFansListViewController.h"
#import "YEFocusListViewController.h"

@interface YEPersonInfoViewController ()

@end

@implementation YEPersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)startLogin:(id)sender {
    
    YELoginViewController *vc = [YELoginViewController new];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (IBAction)startReg:(id)sender {
    
    YERegViewController *vc = [YERegViewController new];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (IBAction)startFocus:(id)sender {
}

- (IBAction)sendMsg:(id)sender {
}

- (IBAction)modifyInfo:(id)sender {
    
    YEModifyPersonInfoViewController *vc = [[YEModifyPersonInfoViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (IBAction)openFansPage:(id)sender {
    
    UIViewController *vc = [[YEFansListViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}


- (IBAction)openFocusPage:(id)sender {
    
    UIViewController *vc = [[YEFocusListViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)setMode:(YEPersonCellMode)mode {
    
    switch (mode) {
        case YEPersonCellLoginMode:
            self.avatarView.hidden = YES;
            self.fansNumBtn.hidden = YES;
            self.focusNumBtn.hidden = YES;
            
            self.fansDescLabel.hidden = YES;
            self.focusDescLabel.hidden = YES;
            
            self.nameLabel.hidden = YES;
            self.signLabel.hidden = YES;
            self.regionLabel.hidden = YES;
            self.receivedLikeNum.hidden = YES;
            
            self.focusBtn.hidden = YES;
            self.sendMsgBtn.hidden = YES;
            self.modifyBtn.hidden = YES;
            
            self.regBtn.hidden = NO;
            self.loginBtn.hidden = NO;
            
            break;
        case YEPersonCellWatcherMode:
            
            self.avatarView.hidden = NO;
            self.fansNumBtn.hidden = NO;
            self.focusNumBtn.hidden = NO;
            
            self.fansDescLabel.hidden = NO;
            self.focusDescLabel.hidden = NO;
            
            self.nameLabel.hidden = NO;
            self.signLabel.hidden = NO;
            self.regionLabel.hidden = NO;
            self.receivedLikeNum.hidden = NO;
            
            self.focusBtn.hidden = NO;
            self.sendMsgBtn.hidden = NO;
            self.modifyBtn.hidden = YES;
            
            self.regBtn.hidden = YES;
            self.loginBtn.hidden = YES;
            break;
        case YEPersonCellOwnerMode:
            
            self.avatarView.hidden = NO;
            self.fansNumBtn.hidden = NO;
            self.focusNumBtn.hidden = NO;
            self.fansDescLabel.hidden = NO;
            self.focusDescLabel.hidden = NO;
            self.nameLabel.hidden = NO;
            self.signLabel.hidden = NO;
            self.regionLabel.hidden = NO;
            self.receivedLikeNum.hidden = NO;
            
            self.focusBtn.hidden = YES;
            self.sendMsgBtn.hidden = YES;
            self.modifyBtn.hidden = NO;
            
            self.regBtn.hidden = YES;
            self.loginBtn.hidden = YES;
            break;
            
        default:
            break;
    }
    
    
}

@end

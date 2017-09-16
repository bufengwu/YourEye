//
//  YELoginViewController.m
//  YourEye
//
//  Created by DevKK on 2017/9/7.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "YELoginViewController.h"
#import "MBProgressHUD.h"

@interface YELoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *telTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *startLoginButton;

@end

@implementation YELoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startLogin:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.dimBackground = YES;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
            
            TEUserProfile *user = [[TEUserProfile alloc]init];
            user.name = @"涉江采芙蓉";
            user.sign = @"可惜旧约圣经，也没挽回你";
            user.region = @"美国@旧金山";
            user.likeNum = @"45";
            user.fansNum = @"978";
            user.focusNum = @"34";
            
            [TEUserManager sharedInstance].userLogged = user;
        });
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  BTDreamDialogController.m
//  YourEye
//
//  Created by DevKK on 2017/9/5.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "BTDreamDialogController.h"

@interface BTDreamDialogController ()

@end

@implementation BTDreamDialogController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    [self.view removeFromSuperview];
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

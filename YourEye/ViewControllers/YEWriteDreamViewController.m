//
//  YEWriteDreamViewController.m
//  YourEye
//
//  Created by DevKK on 2017/9/7.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "YEWriteDreamViewController.h"

@interface YEWriteDreamViewController ()

@end

@implementation YEWriteDreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"填写愿望";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_submit"] style:UIBarButtonItemStyleDone target:self action:@selector(submit)];
    
    
}

- (void)submit {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//
//  HisPageViewController.m
//  YourEye
//
//  Created by DevKK on 2017/9/7.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "HisPageViewController.h"
#import "YEPageVC.h"

#import "YEPersonInfoViewController.h"

@interface HisPageViewController ()
@property (nonatomic, strong) NSArray *titleArray;
@end

@implementation HisPageViewController

- (instancetype)initWithTitles:(NSArray *)titles {
    if (self = [super init]) {
        self.titleArray = titles;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    YEPersonInfoViewController *personVC = [[YEPersonInfoViewController alloc] initWithNibName:@"YEPersonInfoViewController" bundle:nil];
    personVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 300);
    personVC.mode = YEPersonCellWatcherMode;
    [self addChildViewController:personVC];
    [scrollView addSubview:personVC.view];
    
    
    YEPageVC *vc = [[YEPageVC alloc] init];
    vc.view.frame = CGRectMake(0, CGRectGetMaxY(personVC.view.frame), SCREEN_WIDTH, scrollView.frame.size.height-300 );
    [scrollView addSubview:vc.view];
    
    [self addChildViewController:vc];
    
    [self.view addSubview:scrollView];
}

@end

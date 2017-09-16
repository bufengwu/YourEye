//
//  ZYDialogController.m
//  ModernOC
//
//  Created by DevKK on 2017/9/13.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "ZYDialogController.h"
#import <UIKit/UIKit.h>

@implementation ZYDialogController

static UIWindow *window;

+ (void)showDialog {
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    window.rootViewController = vc;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 330, 430)];
    view.center = vc.view.center;
    view.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    [vc.view addSubview:view];
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 300, 400)];
    containerView.backgroundColor = [UIColor greenColor];
    [view addSubview:containerView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(300, 0, 30, 30)];
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"x" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    [window makeKeyAndVisible];
    
    view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
    [UIView animateWithDuration:0.3 animations:^{
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.2 animations:^{
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.8, 0.8);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
            } completion:^(BOOL finished2) {
                view.layer.shouldRasterize = NO;
            }];
        }];
    }];
}

+ (void)close {
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
    [window removeFromSuperview];
    window = nil;
}

@end

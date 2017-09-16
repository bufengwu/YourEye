//
//  HisPageViewController.h
//  YourEye
//
//  Created by DevKK on 2017/9/7.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HisPageViewController : UIViewController

- (instancetype)initWithTitles:(NSArray *)titles;

-(instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));

@end

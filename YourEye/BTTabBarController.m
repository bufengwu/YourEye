//
//  BTTabBarController.m
//  Bang
//
//  Created by admin on 2017/1/7.
//  Copyright © 2017年 Bang. All rights reserved.
//

#import "BTTabBarController.h"

#define kClassKey   @"rootVCClassString"
#define kNavTitleKey   @"navTitle"
#define kTabTitleKey   @"tabTitle"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

@interface BTTabBarController ()

@end

@implementation BTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"BTHomeViewController",
                                   kNavTitleKey  : @"推荐",
                                   kTabTitleKey  : @"推荐",
                                   kImgKey    : @"tab_home",
                                   kSelImgKey : @"tab_home"},
                                 
                                 @{kClassKey  : @"BTDiscoverViewController",
                                   kNavTitleKey  : @"发现",
                                   kTabTitleKey  : @"发现",
                                   kImgKey    : @"tab_discover",
                                   kSelImgKey : @"tab_discover"},
                                 
                                 @{kClassKey  : @"BTDreamViewController",
                                   kNavTitleKey  : @"眼睛",
                                   kTabTitleKey  : @"眼睛",
                                   kImgKey    : @"tab_msg",
                                   kSelImgKey : @"tab_msg"},
                                 
                                 @{kClassKey  : @"YEMeTableViewController",
                                   kNavTitleKey  : @"个人中心",
                                   kTabTitleKey  : @"我",
                                   kImgKey    : @"tab_user",
                                   kSelImgKey : @"tab_user"} ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kNavTitleKey];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTabTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
}

@end

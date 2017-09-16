//
//  YEMeTableViewController.m
//  YourEye
//
//  Created by DevKK on 2017/9/6.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "YEMeTableViewController.h"
#import "JXButton.h"

#import "ZYBaseTableViewController.h"

#import "YEEyeDiaryTableViewController.h"
#import "YEModifyPersonInfoViewController.h"
#import "YELoginViewController.h"
#import "YERegViewController.h"
#import "HisPageViewController.h"

#import "YEFansListViewController.h"
#import "YEFocusListViewController.h"

#import "YEPersonInfoViewController.h"

typedef NS_ENUM(NSUInteger, YEControlTag) {
    YEControlTagLogin,
    YEControlTagReg,
    YEControlTagOpenFans,
    YEControlTagOpenFocus,
    YEControlTagFocus,
    YEControlTagSendMsg,
    YEControlTagModify,
    
    YEControlTagEyeDiary,
    YEControlTagMyDream,
    YEControlTagFavorites,
    YEControlTagMyMsg,
    YEControlTagGoingDream,
    YEControlTagTogether,    
    
    YEControlTagClean,
    YEControlTagHelp,
    YEControlTagSponsor,
};

@interface YEMeTableViewController ()

@property (nonatomic, strong) NSArray * functionArray;

@property (nonatomic, strong) NSArray * functionArray2;

@property (nonatomic, strong) YEPersonInfoViewController *personVC;

@end

@implementation YEMeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.functionArray = @[
                           @{@"icon":@"me_icon_clean",
                             @"title":@"清空缓存",
                             @"detail":@"",
                             @"tag": @(YEControlTagClean)
                             },
                           @{@"icon":@"me_icon_help",
                             @"title":@"帮助与反馈",
                             @"detail":@"",
                             @"tag": @(YEControlTagHelp)
                             },
                           @{@"icon":@"me_icon_sponsor",
                             @"title":@"赞助",
                             @"detail":@"",
                             @"tag": @(YEControlTagSponsor)
                             }
                           ];
    
    self.functionArray2 = @[
                            @{@"icon":@"me_icon_record",
                              @"title":@"眼睛日记 103",
                              @"tag": @(YEControlTagEyeDiary)
                              },
                            @{@"icon":@"me_icon_dream",
                              @"title":@"我的梦 8",
                              @"tag":@(YEControlTagMyDream)
                              },
                            @{@"icon":@"me_icon_favorites",
                              @"title":@"收藏的梦 15",
                              @"tag":@(YEControlTagFavorites)
                              },
                            @{@"icon":@"me_icon_msg",
                              @"title":@"消息 999+",
                              @"tag":@(YEControlTagMyMsg)
                              },
                            @{@"icon":@"me_icon_going",
                              @"title":@"行进中的眼 3",
                              @"tag":@(YEControlTagGoingDream)
                              },
                            @{@"icon":@"me_icon_together",
                              @"title":@"跟随的眼 8",
                              @"tag":@(YEControlTagTogether)
                              },

                            ];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    [self.tableView registerNib:[UINib nibWithNibName:@"YEPersonInfoCell" bundle:nil] forCellReuseIdentifier:@"YEPersonInfoCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"YEPersonFunctionCell" bundle:nil] forCellReuseIdentifier:@"YEPersonFunctionCell"];
    
    self.tableView.bounces = NO;
    self.tableView.tableFooterView = nil;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 3;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        if (!self.personVC) {
            self.personVC = [[YEPersonInfoViewController alloc] init];
            self.personVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 300);
            [self addChildViewController:self.personVC];
            [cell.contentView addSubview:self.personVC.view];
        }
        
        TEUserProfile *user = [TEUserManager sharedInstance].userLogged;
        if (user != nil) {
            self.personVC.mode = YEPersonCellOwnerMode;
            return cell;
        }
        self.personVC.mode = YEPersonCellLoginMode;
        return cell;
        
    } if (indexPath.section == 1) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
        CGFloat w = SCREEN_WIDTH/4;
        
        for (int i = 0; i < self.functionArray2.count; i++) {
            
            JXButton *button = [[JXButton alloc] initWithFrame:CGRectMake( (i%4)*w, (i/4)*w, w, w )];
            
            button.tag = [self.functionArray2[i][@"tag"] intValue];
            [button setTitle:self.functionArray2[i][@"title"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:self.functionArray2[i][@"icon"]] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [cell.contentView addSubview:button];
            
            [button addTarget:self action:@selector(clickFunction:) forControlEvents:UIControlEventTouchUpInside];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = self.functionArray[indexPath.row][@"title"];
        cell.imageView.image = [UIImage imageNamed:self.functionArray[indexPath.row][@"icon"]];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.imageView.frame = CGRectMake(0, 0, 40, 40);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 300;
    } else if (indexPath.section == 1) {
        return SCREEN_WIDTH/2;
    }
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 2) {
        
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"ggg" preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];

        [alertVC addAction:cancelAction];
        [self presentViewController:alertVC animated:YES completion:nil];
        
    }
}

#pragma mark - 

- (void)clickFunction:(UIView *)sender {
    NSLog(@"%ld", (long)sender.tag);
    static UIViewController *vc;
    switch (sender.tag) {
        case YEControlTagLogin:
        {
            YELoginViewController *vc = [YELoginViewController new];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
            break;
            
        case YEControlTagReg:
        {
            YERegViewController *vc = [YERegViewController new];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
            break;
        case YEControlTagEyeDiary:
        {
            YEEyeDiaryTableViewController *vc = [[YEEyeDiaryTableViewController alloc]init];
            
            [self.navigationController pushViewController:vc animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
            break;
            
        case YEControlTagModify:
        {
            YEModifyPersonInfoViewController *vc = [[YEModifyPersonInfoViewController alloc]init];
            
            [self.navigationController pushViewController:vc animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
            break;
            
        case YEControlTagOpenFans:
        {
            vc = [[YEFansListViewController alloc]init];
            
            [self.navigationController pushViewController:vc animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
            break;
        case YEControlTagOpenFocus:
        {
            vc = [[YEFocusListViewController alloc]init];
            
            [self.navigationController pushViewController:vc animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
            break;
        default:
        {
            vc = [[ZYBaseTableViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
    }
}

@end

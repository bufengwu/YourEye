//
//  BTDiscoverViewController.m
//  YourEye
//
//  Created by DevKK on 2017/9/4.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "BTDiscoverViewController.h"
#import "BTAtricleTableViewController.h"
#import "ZYDiscoverTableViewCell.h"

#import "YESearchViewController.h"

#define kAuthorAvatar   @"authorAvatar"
#define kAuthorName     @"authorName"
#define kAskerName      @"kAskerName"
#define kPreviewImage   @"previewImage"
#define kTitle          @"title"
#define kDescription    @"kDescription"
#define kLikeNum        @"kLikeNum"
#define kCommentsNum    @"kCommentsNum"

@interface BTDiscoverViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) NSArray *discoverArticleList;

@end

@implementation BTDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIBarButtonItem *myButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(startSearch)];
    self.navigationItem.rightBarButtonItem = myButton;
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.headerView];
    
    self.discoverArticleList = @[
                                 @{
                                     kAuthorAvatar  : @"avatar.png",
                                     kAuthorName    : @"肖邦的向日葵",
                                     kAskerName     : @"今夕复何夕",
                                     kPreviewImage  : @"h3",
                                     kTitle         : @"天德池里拉东西，第一场雪",
                                     kDescription   : @"新疆◎天池",
                                     kLikeNum       : @"26",
                                     kCommentsNum   : @"1787",
                                     },
                                 @{
                                     kAuthorAvatar  : @"avatar.png",
                                     kAuthorName    : @"肖邦的向日葵",
                                     kAskerName     : @"今夕复何夕",
                                     kPreviewImage  : @"h4",
                                     kTitle         : @"天德池里拉东西，第一场雪",
                                     kDescription   : @"新疆◎天池",
                                     kLikeNum       : @"26",
                                     kCommentsNum   : @"198",
                                     },
                                 @{
                                     kAuthorAvatar  : @"avatar.png",
                                     kAuthorName    : @"肖邦的向日葵",
                                     kAskerName     : @"今夕复何夕",
                                     kPreviewImage  : @"h2",
                                     kTitle         : @"天德池里拉东西，第一场雪",
                                     kDescription   : @"新疆◎天池",
                                     kLikeNum       : @"26",
                                     kCommentsNum   : @"7",
                                     },
                                 ];
}

- (void)startSearch {
    
    YESearchViewController *vc = [[YESearchViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark -

- (UIView *)headerView {
    if (!_headerView) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        NSArray * buttonTitles = @[@"热门", @"时间", @"附近"];
        for (int i = 0; i < 3; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3*i, 0, SCREEN_WIDTH/3, 30)];
            button.layer.borderWidth = 0.5f;
            [button setBackgroundColor:RGB(0, 192, 203)];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button setTitle:buttonTitles[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
            [headerView addSubview:button];
        }
        _headerView = headerView;
    }
    return _headerView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, SCREEN_HEIGHT - 30)];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        [tableView registerNib:[UINib nibWithNibName:@"ZYDiscoverTableViewCell" bundle:nil] forCellReuseIdentifier:@"DISCOVER_CELL"];
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        tableView.backgroundColor = RGB(230, 242, 242);
        
        _tableView = tableView;
        
    }
    return _tableView;
}

#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.discoverArticleList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYDiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DISCOVER_CELL" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *model = self.discoverArticleList[indexPath.row];
    
    cell.authorImage.image = [UIImage imageNamed:model[kAuthorAvatar]];
    cell.authorName.text = model[kAuthorName];
    cell.askerName.text = model[kAskerName];
    cell.previewImage.image = [UIImage imageNamed:model[kPreviewImage]];
    cell.title.text = model[kTitle];
    cell.labelDescription.text = model[kDescription];
    cell.numOfLike.text = model[kLikeNum];
    cell.numOfComments.text = model[kCommentsNum];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.hidesBottomBarWhenPushed=YES;
    
    BTAtricleTableViewController * barVC = [[BTAtricleTableViewController alloc] init];
    
    [self.navigationController pushViewController:barVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}


@end

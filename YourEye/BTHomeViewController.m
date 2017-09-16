//
//  BTHomeViewController.m
//  YourEye
//
//  Created by DevKK on 2017/9/4.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "BTHomeViewController.h"
#import "BTCollectionViewCell.h"
#import "BTBannerCell.h"
#import "BTAtricleTableViewController.h"

#define kTitle          @"title"
#define kPreviewImage   @"previewImage"
#define kAuthorAvatar   @"authorAvatar"
#define kAuthorName     @"authorName"

@interface BTHomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectView;

@property (nonatomic, strong) NSArray *homeArticleList;

@end

@implementation BTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.automaticallyAdjustsScrollViewInsets = NO;

    [self.view addSubview:self.collectView];
    
    self.homeArticleList = @[
                             @{kTitle : @"单车自驾：魔幻张家界",
                               kPreviewImage : @"h1",
                               kAuthorAvatar : @"avatar",
                               kAuthorName : @"懒癌晚期患者"},
                             @{kTitle : @"【斯里兰卡10天】跨过山和大海",
                               kPreviewImage : @"h2",
                               kAuthorAvatar : @"avatar",
                               kAuthorName : @"OO流浪记 "},
                             @{kTitle : @"新西兰——快乐咔嚓声",
                               kPreviewImage : @"h3",
                               kAuthorAvatar : @"avatar",
                               kAuthorName : @"lz杰克"},
                             @{kTitle : @"浪迹非洲最南——“慢得啦”国闲游之一",
                               kPreviewImage : @"h4",
                               kAuthorAvatar : @"avatar",
                               kAuthorName : @"不妥协的妍三三"},
                             @{kTitle : @"环德游——德国自由行",
                               kPreviewImage : @"h5",
                               kAuthorAvatar : @"avatar",
                               kAuthorName : @"LazyCrazyyy"},
                             @{kTitle : @"重庆—吃一顿地道火锅",
                               kPreviewImage : @"h1",
                               kAuthorAvatar : @"avatar",
                               kAuthorName : @"晓"},
                             @{kTitle : @"我的寻（熊）猫之旅",
                               kPreviewImage : @"h1",
                               kAuthorAvatar : @"avatar",
                               kAuthorName : @"athena8890"},
                             ];

}

- (UICollectionView *)collectView {
    if (!_collectView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        UICollectionView *collectView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
        collectView.backgroundColor = RGB(230, 242, 242);
        collectView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        collectView.delegate = self;
        collectView.dataSource = self;

        [collectView registerClass:[BTBannerCell class] forCellWithReuseIdentifier:@"HOME_CELL1"];
        [collectView registerNib:[UINib nibWithNibName:@"BTCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"HOME_CELL"];
        
        _collectView = collectView;
    }
    return _collectView;
}

#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        BTBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HOME_CELL1" forIndexPath:indexPath];
        return cell;
    } else {
        BTCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HOME_CELL" forIndexPath:indexPath];
        
        NSDictionary *model = self.homeArticleList[indexPath.row];
        cell.preImage.image = [UIImage imageNamed:model[kPreviewImage]];
        cell.title.text = model[kTitle];
        cell.authorAvatar.image = [UIImage imageNamed:model[kAuthorAvatar]];
        cell.authorName.text = model[kAuthorName];
        
        return cell;
    }
}

//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 1) {
        return self.homeArticleList.count;
    }
    return 1;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    self.hidesBottomBarWhenPushed=YES;
    
    BTAtricleTableViewController * barVC = [[BTAtricleTableViewController alloc] init];
    
    [self.navigationController pushViewController:barVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

#pragma mark - UICollectionViewDelegateFlowLayout
//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return CGSizeMake(SCREEN_WIDTH, 180);
    } else {
        return CGSizeMake((SCREEN_WIDTH-20)/2, 200);
    }
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return UIEdgeInsetsZero;
    } else {
        return UIEdgeInsetsMake(10, 5, 10, 5);
    }
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

@end

//
//  BTBannerCell.m
//  YourEye
//
//  Created by DevKK on 2017/9/4.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "BTBannerCell.h"
#import "SDCycleScrollView.h"

@implementation BTBannerCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *imageNames = @[@"banner1",
                                @"banner2.jpg",
                                @"banner3.jpg",
                                @"banner4.jpg",
                                @"banner5.jpg",
                                ];
        NSArray *titles = @[@"记我在新疆夜里画圈圈的日子",
                            @"夏の落基山班芙二回目",
                            @"欧洲",
                            @"Love Star Sunshine彩虹天堂金秋行摄",
                            @"女汉子与小汉子从东北到西南",
                            ];
        
        SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
        cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        cycleScrollView2.titlesGroup = titles;
        //        cycleScrollView2.delegate = self;
        
        [self.contentView addSubview:cycleScrollView2];
    }
    
    return self;
}

@end

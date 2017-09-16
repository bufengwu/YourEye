//
//  BTCollectionViewCell.m
//  YourEye
//
//  Created by DevKK on 2017/9/4.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "BTCollectionViewCell.h"

@implementation BTCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 10;
}

@end

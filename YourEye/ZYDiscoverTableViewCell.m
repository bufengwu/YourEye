//
//  ZYDiscoverTableViewCell.m
//  YourEye
//
//  Created by DevKK on 2017/9/5.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "ZYDiscoverTableViewCell.h"

@implementation ZYDiscoverTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame {
    self.layer.cornerRadius = 5;
    frame.origin.x += 10;
    frame.origin.y += 10;
    frame.size.height -= 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}

@end

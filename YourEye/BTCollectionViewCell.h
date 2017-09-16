//
//  BTCollectionViewCell.h
//  YourEye
//
//  Created by DevKK on 2017/9/4.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *preImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *authorAvatar;
@property (weak, nonatomic) IBOutlet UILabel *authorName;

@end

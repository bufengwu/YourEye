//
//  ZYDiscoverTableViewCell.h
//  YourEye
//
//  Created by DevKK on 2017/9/5.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYDiscoverTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *authorImage;

@property (weak, nonatomic) IBOutlet UILabel *authorName;
@property (weak, nonatomic) IBOutlet UIImageView *previewImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *numOfLike;
@property (weak, nonatomic) IBOutlet UILabel *numOfComments;
@property (weak, nonatomic) IBOutlet UILabel *askerName;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;

@end

//
//  BTArticleAuthorCell.h
//  YourEye
//
//  Created by DevKK on 2017/9/5.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTArticleAuthorCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *authorAvatar;
@property (weak, nonatomic) IBOutlet UILabel *authorName;
@property (weak, nonatomic) IBOutlet UIButton *askerName;

@end

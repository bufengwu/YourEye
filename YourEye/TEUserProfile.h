//
//  TEUserProfile.h
//  YourEye
//
//  Created by DevKK on 2017/9/12.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TEUserProfile : NSObject

@property (nonatomic, copy) NSString *avatarURLString;  //头像链接
@property (nonatomic, copy) NSString *name;             //昵称
@property (nonatomic, copy) NSString *sign;             //签名
@property (nonatomic, copy) NSString *region;           //地区

@property (nonatomic, copy) NSString *likeNum;          //获得的赞数量
@property (nonatomic, copy) NSString *fansNum;          //粉丝数量
@property (nonatomic, copy) NSString *focusNum;         //关注的数量

@end

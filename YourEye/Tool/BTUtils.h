//
//  BTUtils.h
//  Bang
//
//  Created by admin on 2017/1/14.
//  Copyright © 2017年 Bang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BTUtils : NSObject

//+ (UIImage *)imageWithColor:(UIColor *)color radius:(CGFloat)radius;

//+ (UIImage *)circleImage:(UIImage *)srcImage;

+ (void) setButtonContentCenter:(UIButton *)button;


/**
 生成一个随机颜色的圆形图片

 @param radius 直径
 @return 图片
 */
+ (UIImage *)circleRandColorImageWithRadius:(CGFloat)radius;

+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;


@end

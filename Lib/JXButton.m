//
//  JXButton.m
//  JXButtonDemo
//
//  Created by pconline on 2016/11/28.
//  Copyright © 2016年 pconline. All rights reserved.
//

#import "JXButton.h"

@implementation JXButton

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self commonInit];
        
        self.layer.borderWidth = 1;
        self.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor lightGrayColor]);
        
    }
    return self;
}

-(void)commonInit{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat imageW = CGRectGetWidth(contentRect);
    return CGRectMake(0, imageW*0.65, imageW, imageW*0.2);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageW = CGRectGetWidth(contentRect);
    return CGRectMake(imageW*0.3, imageW*0.2, imageW*0.4, imageW*0.4);
}

@end

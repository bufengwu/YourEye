//
//  TEUserManager.m
//  YourEye
//
//  Created by DevKK on 2017/9/12.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "TEUserManager.h"

@implementation TEUserManager

+ (TEUserManager *)sharedInstance {
    static TEUserManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}

@end

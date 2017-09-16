//
//  TEUserManager.h
//  YourEye
//
//  Created by DevKK on 2017/9/12.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TEUserProfile.h"

@interface TEUserManager : NSObject

@property (nonatomic, strong) TEUserProfile *userLogged;

+ (TEUserManager *)sharedInstance;

@end

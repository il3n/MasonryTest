//
//  SysVersion.m
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "SysVersion.h"
#import <UIKit/UIKit.h>

@implementation SysVersion

+ (NSInteger)sysMajorVersion
{
    static dispatch_once_t onceToken;
    static int major = -1; //大版本号。如"iOS9.2.1"的"9"。
    dispatch_once(&onceToken, ^{
        NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
        NSArray *components = [systemVersion componentsSeparatedByString:@"."];
        if (components.count > 0) {
            major = [components[0] intValue];
        }
        major = (major > 0) ? major : 0;
    });
    return major;
}

+ (NSInteger)sysMinorVersion
{
    static dispatch_once_t onceToken;
    static int minor = -1; //小版本号。如"iOS9.2.1"的"2"。
    dispatch_once(&onceToken, ^{
        NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
        NSArray *components = [systemVersion componentsSeparatedByString:@"."];
        if (components.count > 1) {
            minor = [components[1] intValue];
        }
        minor = (minor > 0) ? minor : 0;
    });
    return minor;
}

@end

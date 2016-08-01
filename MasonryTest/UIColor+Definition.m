//
//  UIColor+Definition.m
//  MasonryTest
//
//  Created by lijun on 16/8/1.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "UIColor+Definition.h"

@implementation UIColor (Definition)

//由16进制字符串获取颜色，支持RGB和ARGB格式
+ (UIColor *)colorWithHexRGB:(NSString *)hexRGBString
{
    NSString *formatString = [hexRGBString hasPrefix:@"#"] ? [hexRGBString substringFromIndex:1] : hexRGBString;
    if (formatString.length == 6 || formatString.length == 8) {
        unsigned int colorCode = 0;
        unsigned char redByte, greenByte, blueByte, alphaByte;
        
        NSScanner *scanner = [NSScanner scannerWithString:formatString];
        [scanner scanHexInt:&colorCode];
        
        if (formatString.length == 6) { //RGB
            alphaByte = 0xff;
        } else { //ARGB
            alphaByte = (unsigned char) (colorCode >> 24);
        }
        redByte     = (unsigned char) (colorCode >> 16);
        greenByte   = (unsigned char) (colorCode >> 8);
        blueByte    = (unsigned char) (colorCode);
        
        return [UIColor colorWithRed:(float)redByte/0xff green:(float)greenByte/0xff blue:(float)blueByte/0xff alpha:(float)alphaByte/0xff];
    }
    return [UIColor clearColor];
}


@end

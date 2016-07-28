//
//  UILabel+Size.m
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "UILabel+Size.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"


@implementation UILabel (Size)

- (CGSize)boundingRectWithSize:(CGSize)size
{
    if (!self.text.length) return CGSizeZero;
    
    static float version = 0.0;
    if (version <= 0.0) {
        version = [[[UIDevice currentDevice] systemVersion] floatValue];
    }
    
    CGSize s = CGSizeZero;
    
    if ([self.text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        s = [self.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    } else {
        s = [self.text sizeWithFont:self.font constrainedToSize:size lineBreakMode:self.lineBreakMode];
    }
    
    return s;
}
@end


#pragma clang diagnostic pop
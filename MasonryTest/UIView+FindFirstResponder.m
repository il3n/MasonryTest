//
//  UIView+FindFirstResponder.m
//  MasonryTest
//
//  Created by lijun on 16/8/8.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "UIView+FindFirstResponder.h"

@implementation UIView (FindFirstResponder)

- (id)findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        id responder = [subView findFirstResponder];
        if (responder) return responder;
    }
    return nil;
}

@end

//
//  UIBaseView.m
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "UIBaseView.h"

@implementation UIBaseView

-(instancetype) init {
    self = [super init];
    if (self) {
        [self i_setupSubviews];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self i_setupSubviews];
    }
    return self;
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self i_setupSubviews];
    }
    return self;
}

#pragma mark-inhert

-(void) i_setupSubviews {
    
}

@end

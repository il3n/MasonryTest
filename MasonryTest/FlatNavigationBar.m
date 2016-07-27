//
//  FlatNavigationBar.m
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "FlatNavigationBar.h"
#import <Masonry.h>
#import "UIColor+JKRandom.h"

@implementation FlatNavigationBar

-(id) init {
    if (self = [super init]) {
        [self p_setupSubviews];
    }
    
    return self;
}

-(id) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self p_setupSubviews];
    }
    
    return self;
}

#pragma mark-private method

-(void) p_setupSubviews {
    
    [self addSubview:self.backButton];
    [self addSubview:self.titleLabel];
}

-(void) p_backButtonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(flatNavigationBar:backButtonDidPressed:)]) {
        [self.delegate flatNavigationBar:self backButtonDidPressed:sender];
    }
}

#pragma mark-layout

+(BOOL) requiresConstraintBasedLayout {
    return YES;
}

-(void) updateConstraints {
//    [self.backButton mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(@0);
//        make.top.equalTo(@20);
//        make.width.equalTo(@60);
//        make.height.equalTo(@40);
//    }];
    
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right).offset(-1);

        make.top.equalTo(@20);
        make.height.equalTo(@40);
    }];
    
    [super updateConstraints];
}

#pragma mark-getter
-(UIButton *) backButton {
    if (!_backButton) {
        
        _backButton = [[UIButton alloc] init];
        [_backButton addTarget:self action:@selector(p_backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _backButton.backgroundColor = [UIColor jk_randomColor];
    }
    return _backButton;
}

-(UILabel *) titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 1;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor jk_randomColor];
    }
    
    return _titleLabel;
}

@end

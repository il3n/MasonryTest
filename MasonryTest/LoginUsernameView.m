//
//  LoginView.m
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "LoginUsernameView.h"

@interface LoginUsernameView ()
@property (nonatomic, strong) UIImageView *textfieldBackgroundImageView;
@end

@implementation LoginUsernameView

#pragma mark-private method

-(void) p_buttonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(loginUsernameView:didPressedRegisterButton:)]) {
        [self.delegate loginUsernameView:self didPressedRegisterButton:sender];
    }
}

#pragma mark-layout

-(void) layoutSubviews {
    [super layoutSubviews];
    
    
}

#pragma mark-getter

-(UIButton *) button {
    
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button addTarget:self action:@selector(p_buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _button.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _button;
}

-(UITextField *) textfield {
    if (!_textfield) {
        _textfield = [[UITextField alloc] init];
    }
    return _textfield;
}

-(UILabel *) titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

-(UILabel *) bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        _bottomLabel.numberOfLines = 0;
    }
    return _bottomLabel;
}

@end

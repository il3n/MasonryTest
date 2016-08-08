//
//  LoginView.m
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "LoginView.h"
#import "UILabel+Size.h"

@implementation LoginView

#pragma mark-inhert

-(void) i_setupSubviews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.usernameField];
    [self addSubview:self.passwordField];
    [self addSubview:self.loginButton];
    [self addSubview:self.forgetPasswordButton];
}

#pragma mark-private method

-(void) p_loginButtonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(loginView:didPressedLoginButton:)]) {
        [self.delegate loginView:self didPressedLoginButton:sender];
    }
}

-(void) p_forgetPasswordButtonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(loginView:didPressedForgetPasswordButton:)]) {
        [self.delegate loginView:self didPressedForgetPasswordButton:sender];
    }
}

#pragma mark-layout

-(void) layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.preferredMaxLayoutWidth = self.bounds.size.width-2*kMargin10;
    CGSize labelSize = [self.titleLabel boundingRectWithSize:CGSizeMake(self.titleLabel.preferredMaxLayoutWidth, NSIntegerMax)];
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kMargin10);
        make.right.equalTo(self).offset(-kMargin10);
        make.top.equalTo(@(kMargin20));
        make.height.equalTo(@(ceil(labelSize.height)));
    }];
    
    [self.usernameField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kMargin20);
        make.right.equalTo(self).offset(-kMargin20);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(350);
        make.height.equalTo(@(kMagicNumber40));
    }];
    
    [self.passwordField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.usernameField);
        make.right.equalTo(self.usernameField);
        make.top.equalTo(self.usernameField.mas_bottom);
        make.height.equalTo(self.usernameField);
    }];
    
    [self.loginButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.usernameField);
        make.right.equalTo(self.usernameField);
        make.top.equalTo(self.passwordField.mas_bottom).offset(kMargin20);
        make.height.equalTo(@(kButtonHeightDefault));
    }];

    [self.forgetPasswordButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loginButton);
        make.right.equalTo(self.loginButton);
        make.top.equalTo(self.loginButton.mas_bottom).offset(kMargin10);
        make.height.equalTo(@(kMagicNumber20));
    }];
}

#pragma mark-getter

-(UIButton *) loginButton {
    
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] init];
        [_loginButton addTarget:self action:@selector(p_loginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _loginButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _loginButton.backgroundColor = [UIColor jk_randomColor];
    }
    
    return _loginButton;
}

-(UIButton *) forgetPasswordButton {
    if (!_forgetPasswordButton) {
        _forgetPasswordButton = [[UIButton alloc] init];
        [_forgetPasswordButton addTarget:self action:@selector(p_forgetPasswordButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _forgetPasswordButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _forgetPasswordButton.backgroundColor = [UIColor jk_randomColor];
    }
    return _forgetPasswordButton;
}

-(RichTextfield *) usernameField {
    if (!_usernameField) {
        _usernameField = [[RichTextfield alloc] initWithRichTextFieldType:RichTextfieldTypeUsername];
        _usernameField.backgroundColor = [UIColor jk_randomColor];
    }
    return _usernameField;
}

-(RichTextfield *) passwordField {
    if (!_passwordField) {
        _passwordField = [[RichTextfield alloc] initWithRichTextFieldType:RichTextfieldTypePassword];
        _passwordField.backgroundColor = [UIColor jk_randomColor];
    }
    
    return _passwordField;
}

-(UILabel *) titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        _titleLabel.backgroundColor = [UIColor jk_randomColor];
        _titleLabel.text = @"titleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabel";
        _titleLabel.font = [UIFont systemFontOfSize:kFontSize15];
    }
    return _titleLabel;
}



@end

//
//  MainView.m
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "MainView.h"

@implementation MainView

#pragma mark-inhert

-(void) i_setupSubviews {
    [self addSubview:self.iconImageView];
    [self addSubview:self.loginButton];
    [self addSubview:self.registerButton];
    [self addSubview:self.demoListButton];
}

#pragma mark-private method

-(void) p_loginButtonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(mainView:didPressedLoginButton:)]) {
        [self.delegate mainView:self didPressedLoginButton:sender];
    }
}

-(void) p_registerButtonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(mainView:didPressedRegisterButton:)]) {
        [self.delegate mainView:self didPressedRegisterButton:sender];
    }
}

-(void) p_demoListButtonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(mainView:didPressedDemoListButton:)]) {
        [self.delegate mainView:self didPressedDemoListButton:sender];
    }
}

#pragma mark-layout

-(void) layoutSubviews {
    
    [super layoutSubviews];
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(kMainViewIconWidth));
        make.height.equalTo(@(kMainViewIconHeight));
        make.top.equalTo(@(self.bounds.size.height*kMagicNumberDot2));
        make.left.equalTo(@((self.bounds.size.width-kMainViewIconWidth)/2.0));
    }];
    
    [self.loginButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).offset(kMargin30);
        make.height.equalTo(@(kButtonHeightDefault));
        make.left.equalTo(self).offset(kMargin20);
        make.right.equalTo(self).offset(-kMargin20);
    }];
    
    [self.registerButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginButton.mas_bottom).offset(kMargin10);
        make.height.equalTo(@(kButtonHeightDefault));
        make.left.equalTo(self).offset(kMargin20);
        make.right.equalTo(self).offset(-kMargin20);
    }];
    
    [self.demoListButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.registerButton.mas_bottom).offset(kMargin15);
        make.height.equalTo(@(kButtonHeightDefault));
        make.left.equalTo(self).offset(kMargin20);
        make.right.equalTo(self).offset(-kMargin20);
    }];
}

#pragma mark-getter

-(UIButton *) loginButton {
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] init];
        _loginButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_loginButton addTarget:self action:@selector(p_loginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _loginButton.backgroundColor = [UIColor jk_randomColor];
    }
    return _loginButton;
}

-(UIButton *) registerButton {
    if (!_registerButton) {
        _registerButton = [[UIButton alloc] init];
        _registerButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_registerButton addTarget:self action:@selector(p_registerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _registerButton.backgroundColor = [UIColor jk_randomColor];
    }
    return _registerButton;
}

-(UIButton *) demoListButton {
    if (!_demoListButton) {
        _demoListButton = [[UIButton alloc] init];
        [_demoListButton addTarget:self action:@selector(p_demoListButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _demoListButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _demoListButton.backgroundColor = [UIColor jk_randomColor];
    }
    
    return _demoListButton;
}

-(UIImageView *) iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = [UIColor jk_randomColor];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconImageView;
}

@end

//
//  LoginViewController.m
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
@interface LoginViewController ()<LoginViewDelegate>
@property (nonatomic, strong) LoginView *loginView;
@end

@implementation LoginViewController

#pragma mark-inhert

-(void) i_setupSubviews {
    self.flatNavigationBarTitle = @"登录";
    [self.view addSubview:self.loginView];
}

#pragma mark-delegate

-(void) loginView:(LoginView *)loginView didPressedForgetPasswordButton:(UIButton *)forgetPasswordButton {
    
}

-(void) loginView:(LoginView *)loginView didPressedLoginButton:(UIButton *)loginButton {
    
}

#pragma mark-layout

-(void) viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    [self.loginView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(kStatusBarHeight+kNavigationBarHeight));
        make.left.equalTo(@0);
        make.width.equalTo(@(self.view.bounds.size.width));
        make.height.equalTo(@(self.view.bounds.size.height-(kStatusBarHeight+kNavigationBarHeight)));
    }];
}

#pragma mark-getter

-(LoginView *) loginView {
    if (!_loginView) {
        _loginView = [[LoginView alloc] initWithFrame:CGRectZero];
        _loginView.delegate = self;
    }
    return _loginView;
}

@end

//
//  LoginViewController.m
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "FPUsernameViewController.h"
#import "UIViewController+KeyboardEvent.h"

@interface LoginViewController ()<LoginViewDelegate, KeyboardEventProtocol>
@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, assign) CGFloat viewOffset;
@end

@implementation LoginViewController

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addKeyboardEvent];
    self.keyboardEventDelegate = self;
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeKeyboardEvent];
}

#pragma mark-inhert

-(void) i_setupSubviews {
    self.flatNavigationBarTitle = @"登录";
    [self.view addSubview:self.loginView];
}

#pragma mark-delegate

-(void) loginView:(LoginView *)loginView didPressedForgetPasswordButton:(UIButton *)forgetPasswordButton {
    [self p_pushFPUsernameViewController];
}

-(void) loginView:(LoginView *)loginView didPressedLoginButton:(UIButton *)loginButton {
    
}

-(void) keyboardEvent:(UIView *)firstResponder offset:(CGFloat)offset {
    DDLogInfo(@"firstResponder:%@", firstResponder);
    self.viewOffset = offset;
}

#pragma mark-private method

-(void) p_pushFPUsernameViewController {
    FPUsernameViewController *fpUsernameViewController = [[FPUsernameViewController alloc] initWithFlatNavigationBar];
    [self.navigationController pushViewController:fpUsernameViewController animated:YES];
}

#pragma mark-layout

-(void) viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    [self.loginView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(kStatusBarHeight+kNavigationBarHeight-self.viewOffset));
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

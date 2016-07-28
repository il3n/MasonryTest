//
//  LoginViewController.m
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "LoginUsernameViewController.h"
#import <Masonry.h>
#import "LoginView.h"
#import "UIColor+JKRandom.h"

@interface LoginUsernameViewController ()<LoginViewDelegate>
@property (nonatomic, strong) LoginView *loginView;
@end

@implementation LoginUsernameViewController

-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

-(void) viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark-inherit

-(void) i_setupSubviews {
    
    self.flatNavigationBarTitle = @"注册";
    
    [self.view addSubview:self.loginView];
}

#pragma mark-layout

-(void) viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    [self.loginView mas_updateConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(@64);
        make.left.equalTo(@0);
        make.width.equalTo(@(self.view.bounds.size.width));
        make.height.equalTo(@(self.view.bounds.size.height-64));
    }];
}

#pragma mark-getter

-(LoginView *)loginView {
    
    if (!_loginView) {
        _loginView = [[LoginView alloc] initWithFrame:CGRectZero];
        _loginView.delegate = self;
    }
    
    return _loginView;
}

@end





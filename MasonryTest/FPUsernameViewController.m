//
//  ForgetPasswordViewController.m
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "FPUsernameViewController.h"
#import "RegisterUsernameView.h"
#import "FPPasswordViewController.h"

@interface FPUsernameViewController ()<RegisterUsernameViewDelegate>
@property (nonatomic, strong) RegisterUsernameView *forgetPasswordView;
@end

@implementation FPUsernameViewController


#pragma mark-delegate

-(void) registerUsernameView:(RegisterUsernameView *)registerUsernameView didPressedRegisterButton:(UIButton *)registerButton {
    
    // press register button
    [self p_pushFPPasswordViewController];
}

#pragma mark-inherit

-(void) i_setupSubviews {
    self.flatNavigationBarTitle = @"忘记密码";
    [self.view addSubview:self.forgetPasswordView];
}

#pragma mark-private method

-(void) p_pushFPPasswordViewController {
    
    FPPasswordViewController *fpPasswordViewController = [[FPPasswordViewController alloc] initWithFlatNavigationBar];
    [self.navigationController pushViewController:fpPasswordViewController animated:YES];
}

#pragma mark-layout

-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.forgetPasswordView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(kStatusBarHeight+kNavigationBarHeight));
        make.left.equalTo(@0);
        make.width.equalTo(@(self.view.bounds.size.width));
        make.height.equalTo(@(self.view.bounds.size.height-(kStatusBarHeight+kNavigationBarHeight)));
    }];
}

#pragma mark-getter

-(RegisterUsernameView *)forgetPasswordView {
    
    if (!_forgetPasswordView) {
        _forgetPasswordView = [[RegisterUsernameView alloc] initWithFrame:CGRectZero];
        _forgetPasswordView.delegate = self;
    }
    
    return _forgetPasswordView;
}
@end

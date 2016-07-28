//
//  RegisterPasswordViewController.m
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "RegisterPasswordViewController.h"
#import "RegisterPasswordView.h"

@interface RegisterPasswordViewController ()<RegisterPasswordViewDelegate>
@property (nonatomic, strong) RegisterPasswordView *registerPasswordView;
@end

@implementation RegisterPasswordViewController

#pragma mark-inheart

-(void) i_setupSubviews {
    self.flatNavigationBarTitle = @"设置密码";
    [self.view addSubview:self.registerPasswordView];
}

#pragma mark-delegate

-(void) registerPasswordView:(RegisterPasswordView *)registerPasswordView didPressedRegisterButton:(UIButton *)registerButton {
    
}

#pragma mark-layout

-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    DDLogVerbose(@"self.bounds:%@", NSStringFromCGRect(self.view.bounds));
    [self.registerPasswordView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.width.equalTo(@(self.view.bounds.size.width));
        make.top.equalTo(@(kStatusBarHeight+kNavigationBarHeight));
        make.height.equalTo(@(self.view.bounds.size.height-(kStatusBarHeight+kNavigationBarHeight)));
    }];
}

#pragma mark-getter

-(RegisterPasswordView *) registerPasswordView {
    if (!_registerPasswordView) {
        _registerPasswordView = [[RegisterPasswordView alloc] initWithFrame:CGRectZero];
    }
    return _registerPasswordView;
}

@end

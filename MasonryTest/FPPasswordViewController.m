//
//  FPPasswordViewController.m
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "FPPasswordViewController.h"
#import "RegisterPasswordView.h"

@interface FPPasswordViewController ()<RegisterPasswordViewDelegate>
@property (nonatomic, strong) RegisterPasswordView *forgetPasswordView;
@end

@implementation FPPasswordViewController


#pragma mark-inheart

-(void) i_setupSubviews {
    self.flatNavigationBarTitle = @"设置密码";
    [self.view addSubview:self.forgetPasswordView];
}

#pragma mark-delegate

-(void) registerPasswordView:(RegisterPasswordView *)registerPasswordView didPressedRegisterButton:(UIButton *)registerButton {
    
}

#pragma mark-layout

-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.forgetPasswordView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.width.equalTo(@(self.view.bounds.size.width));
        make.top.equalTo(@(kStatusBarHeight+kNavigationBarHeight));
        make.height.equalTo(@(self.view.bounds.size.height-(kStatusBarHeight+kNavigationBarHeight)));
    }];
}


#pragma mark-getter

-(RegisterPasswordView *)forgetPasswordView {
    
    if (!_forgetPasswordView) {
        _forgetPasswordView = [[RegisterPasswordView alloc] initWithFrame:CGRectZero];
        _forgetPasswordView.delegate = self;
    }
    
    return _forgetPasswordView;
}

@end

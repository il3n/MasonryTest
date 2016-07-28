//
//  registerViewController.m
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "RegisterUsernameViewController.h"
#import "RegisterUsernameView.h"
#import "RegisterPasswordViewController.h"

@interface RegisterUsernameViewController ()<RegisterUsernameViewDelegate>
@property (nonatomic, strong) RegisterUsernameView *registerView;
@end

@implementation RegisterUsernameViewController

#pragma mark-delegate

-(void) registerUsernameView:(RegisterUsernameView *)registerUsernameView didPressedRegisterButton:(UIButton *)registerButton {
    DDLogVerbose(@":register button pressed");
    
    // press register button
    [self p_pushRegisterPasswordViewController];
}

#pragma mark-inherit

-(void) i_setupSubviews {
    self.flatNavigationBarTitle = @"注册";
    [self.view addSubview:self.registerView];
}

#pragma mark-private method

-(void) p_pushRegisterPasswordViewController {
    
    RegisterPasswordViewController *registerPasswordViewController = [[RegisterPasswordViewController alloc] initWithFlatNavigationBar];
    [self.navigationController pushViewController:registerPasswordViewController animated:YES];
}

#pragma mark-layout

-(void) viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    [self.registerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(kStatusBarHeight+kNavigationBarHeight));
        make.left.equalTo(@0);
        make.width.equalTo(@(self.view.bounds.size.width));
        make.height.equalTo(@(self.view.bounds.size.height-(kStatusBarHeight+kNavigationBarHeight)));
    }];
}

#pragma mark-getter

-(RegisterUsernameView *)registerView {
    
    if (!_registerView) {
        _registerView = [[RegisterUsernameView alloc] initWithFrame:CGRectZero];
        _registerView.delegate = self;
    }
    
    return _registerView;
}

@end





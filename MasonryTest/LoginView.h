//
//  LoginView.h
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "UIBaseView.h"
#import "RichTextfield.h"

@class LoginView;
@protocol LoginViewDelegate <NSObject>
-(void) loginView:(LoginView *)loginView didPressedForgetPasswordButton:(UIButton *)forgetPasswordButton;
-(void) loginView:(LoginView *)loginView didPressedLoginButton:(UIButton *)loginButton;
@end

@interface LoginView : UIBaseView

@property (nonatomic, strong) RichTextfield *usernameField;
@property (nonatomic, strong) RichTextfield *passwordField;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *forgetPasswordButton;
@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, weak) id<LoginViewDelegate>delegate;

@end

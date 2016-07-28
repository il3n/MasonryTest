//
//  LoginView.h
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginUsernameView;
@protocol LoginUsernameViewDelegate <NSObject>
-(void) loginUsernameView:(LoginUsernameView *)loginUsernameView didPressedRegisterButton:(UIButton *)registerButton;
@end

@interface LoginUsernameView : UIView

@property (nonatomic, weak) id<LoginUsernameViewDelegate>delegate;

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UITextField *textfield;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *bottomLabel;

@end

//
//  LoginView.h
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//
#import "UIBaseView.h"
#import "RichTextfield.h"

@class RegisterUsernameView;
@protocol RegisterUsernameViewDelegate <NSObject>
-(void) registerUsernameView:(RegisterUsernameView *)registerUsernameView didPressedRegisterButton:(UIButton *)registerButton;
@end

@interface RegisterUsernameView : UIBaseView

@property (nonatomic, weak) id<RegisterUsernameViewDelegate>delegate;

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *bottomLabel;
@property (nonatomic, strong) RichTextfield *usernameField;

@end

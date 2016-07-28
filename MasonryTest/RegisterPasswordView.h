//
//  RegisterPasswordView.h
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "UIBaseView.h"
#import "RichTextfield.h"

@class RegisterPasswordView;
@protocol RegisterPasswordViewDelegate <NSObject>
-(void) registerPasswordView:(RegisterPasswordView *)registerPasswordView didPressedRegisterButton:(UIButton *)registerButton;
@end

@interface RegisterPasswordView : UIBaseView
@property (nonatomic, weak) id<RegisterPasswordViewDelegate>delegate;

@property (nonatomic, strong) RichTextfield *passwordField1;
@property (nonatomic, strong) RichTextfield *passwordField2;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *bottomLabel;


@end

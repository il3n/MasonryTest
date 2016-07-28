//
//  LoginView.h
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginView;
@protocol LoginViewDelegate <NSObject>
@end

@interface LoginView : UIView

@property (nonatomic, weak) id<LoginViewDelegate>delegate;


@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UITextField *textfield;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *bottomLable;

@end

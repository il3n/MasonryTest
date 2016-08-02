//
//  MainView.h
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "UIBaseView.h"

@class MainView;
@protocol MainViewDelegate <NSObject>

-(void) mainView:(MainView *)mainView didPressedLoginButton:(UIButton *)loginButton;
-(void) mainView:(MainView *)mainView didPressedRegisterButton:(UIButton *)registerButton;
-(void) mainView:(MainView *)mainView didPressedDemoListButton:(UIButton *)demoListButton;

@end

@interface MainView : UIBaseView

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *demoListButton;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIImageView *backgroundImageView;

@property (nonatomic, weak) id<MainViewDelegate>delegate;

@end

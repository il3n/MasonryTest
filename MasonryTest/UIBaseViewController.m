//
//  UIBaseViewController.m
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "UIBaseViewController.h"
#import "FlatNavigationBar.h"
#import "UIColor+JKRandom.h"
#import <Masonry.h>

@interface UIBaseViewController ()<FlatNavigationBarDelegate>
@property (nonatomic, assign, readonly) BOOL showFlatNavigationBar;
@property (nonatomic, strong) FlatNavigationBar *flatNavigationBar;
@end

@implementation UIBaseViewController

-(instancetype) initWithFlatNavigationBar {
    
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        [self p_setupFlatNavigationBar];
    }
    
    return self;
}

-(void) viewDidLoad {
    
    [super viewDidLoad];
    
    [self i_setupSubviews];
}

-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if (self.showFlatNavigationBar) {
        self.navigationController.navigationBarHidden = YES;
    }
}

-(void) viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    if (self.showFlatNavigationBar) {
        self.navigationController.navigationBarHidden = NO;
    }
}

-(void) loadView {
    
    self.view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void) i_setupSubviews {
    
}

#pragma mark-setter

-(void) setFlatNavigationBarTitle:(NSString *)flatNavigationBarTitle {
    
    _flatNavigationBarTitle = [flatNavigationBarTitle copy];
    self.flatNavigationBar.titleLabel.text = _flatNavigationBarTitle;
}

#pragma mark-layout

-(void) viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    [self.flatNavigationBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.view.bounds.size.width));
        make.height.equalTo(@64);
        make.left.equalTo(@0);
        make.top.equalTo(@0);
    }];
}

#pragma mark-delegate

-(void) flatNavigationBar:(FlatNavigationBar *)flatNavigationBar backButtonDidPressed:(UIButton *)backButton {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark-private method

-(void) p_setupFlatNavigationBar {
    _showFlatNavigationBar = YES;
    
    _flatNavigationBar = [[FlatNavigationBar alloc] initWithFrame:CGRectZero];
    _flatNavigationBar.delegate = self;
    [self.view addSubview:_flatNavigationBar];
}

@end













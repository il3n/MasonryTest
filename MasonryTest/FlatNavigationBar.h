//
//  FlatNavigationBar.h
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlatNavigationBar;
@protocol FlatNavigationBarDelegate <NSObject>

-(void) flatNavigationBar:(FlatNavigationBar *)flatNavigationBar backButtonDidPressed:(UIButton *)backButton;

@end

@interface FlatNavigationBar : UIView
@property (nonatomic, weak) id<FlatNavigationBarDelegate>delegate;

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *titleLabel;

@end

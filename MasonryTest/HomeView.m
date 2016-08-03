//
//  HomeView.m
//  MasonryTest
//
//  Created by lijun on 16/8/3.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "HomeView.h"

@interface HomeView ()<PieChartButtonDelegate>

@end

@implementation HomeView

#pragma mark-init

-(void) i_setupSubviews {
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.pieChartButton];
    [self addSubview:self.setButton];
    [self addSubview:self.alarmButton];
}

#pragma mark-private method

-(void) p_setButtonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(homeView:didSelectedSetButton:)]) {
        [self.delegate homeView:self didSelectedSetButton:sender];
    }
}

-(void) p_alarmButtonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(homeView:didSelectedAlarmButton:)]) {
        [self.delegate homeView:self didSelectedAlarmButton:sender];
    }
}

#pragma mark-delegate

-(void) pieChartButton:(PieChartButton *)pieChartButton didSelectButtonType:(PieChartType)pieChartType {
    if ([self.delegate respondsToSelector:@selector(homeView:didSelectedPieChartButton:)]) {
        [self.delegate homeView:self didSelectedPieChartButton:pieChartType];
    }
}

#pragma mark-layout

-(void) layoutSubviews {
    [super layoutSubviews];
    
    [self.backgroundImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.pieChartButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(kPieChartButtonRadius));
        make.height.equalTo(@(kPieChartButtonRadius));
        make.top.equalTo(@(kMagicNumber0));
        
    }];
}

#pragma mark-getter

-(UIImageView *) backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backgroundImageView;
}

-(PieChartButton *) pieChartButton {
    if (!_pieChartButton) {
        _pieChartButton = [[PieChartButton alloc] initWithLeftImageName:nil rightImageName:nil bottomImageName:nil radius:kPieChartButtonRadius];
        _pieChartButton.delegate = self;
    }
    
    return _pieChartButton;
}

-(UIButton *) setButton {
    if (!_setButton) {
        _setButton = [[UIButton alloc] init];
        [_setButton addTarget:self action:@selector(p_setButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _setButton;
}

-(UIButton *) alarmButton {
    if (!_alarmButton) {
        _alarmButton = [[UIButton alloc] init];
        [_alarmButton addTarget:self action:@selector(p_alarmButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _alarmButton;
}

@end

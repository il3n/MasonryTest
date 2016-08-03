//
//  HomeView.h
//  MasonryTest
//
//  Created by lijun on 16/8/3.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "UIBaseView.h"
#import "PieChartButton.h"

@class HomeView;

@protocol HomeViewDelegate <NSObject>

-(void) homeView:(HomeView *)homeView didSelectedPieChartButton:(PieChartType)pieChartButtonType;
-(void) homeView:(HomeView *)homeView didSelectedSetButton:(UIButton *)sentButton;
-(void) homeView:(HomeView *)homeView didSelectedAlarmButton:(UIButton *)alarmButton;

@end


@interface HomeView : UIBaseView

@property (nonatomic, strong) PieChartButton *pieChartButton;
@property (nonatomic, strong) UIButton *setButton;
@property (nonatomic, strong) UIButton *alarmButton;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, weak) id<HomeViewDelegate>delegate;

@end

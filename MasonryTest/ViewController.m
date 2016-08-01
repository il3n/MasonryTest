//
//  ViewController.m
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "ViewController.h"
#import "RegisterUsernameViewController.h"
#import "LoginViewController.h"
#import "MainView.h"
#import "FPUsernameViewController.h"
#import "PieChartButton.h"

@interface ViewController ()<MainViewDelegate, PieChartButtonDelegate>
@property (nonatomic, strong) PieChartButton *pcButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    
//    MainView *mainView = [[MainView alloc] initWithFrame:self.view.bounds];
//    mainView.backgroundColor = [UIColor jk_randomColor];
//    mainView.delegate = self;
//    [self.view addSubview:mainView];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.pcButton = [[PieChartButton alloc] initWithLeftImageName:nil rightImageName:nil bottomImageName:nil radius:kPieChartButtonRadius];
    self.pcButton.delegate = self;
    [self.view addSubview:self.pcButton];
}

-(void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
//    [self.pcButton mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.size.mas_equalTo(CGSizeMake(kPieChartButtonRadius*2, kPieChartButtonRadius*2));
//    }];

    self.pcButton.frame = self.view.bounds;
}

-(void) p_addPieChart {
    
    float currentValue = -M_PI_2;
    CGPoint center = CGPointMake(CGRectGetMidX(self.view.bounds),CGRectGetMidY(self.view.bounds));
    for (NSInteger i = 0; i < 1; i++)
    {
        CGFloat startPercnetage = currentValue;
        CGFloat endPercentage   = (currentValue + M_PI*2/3.0);
        
        //_bezierPath形成闭合的扇形路径
        UIBezierPath *_bezierPath = [UIBezierPath bezierPathWithArcCenter:center
                                                                   radius:100
                                                               startAngle:startPercnetage                                                                 endAngle:endPercentage
                                                                clockwise:YES];
        
        [_bezierPath addLineToPoint:center];
        [_bezierPath closePath];
        
        CAShapeLayer *_shapeLayer=[CAShapeLayer layer];
        _shapeLayer.lineWidth = 1;
        
        _shapeLayer.fillColor = [UIColor jk_randomColor].CGColor;
        _shapeLayer.path = _bezierPath.CGPath;
        [self.view.layer addSublayer:_shapeLayer];
        
        currentValue = endPercentage;
        
    }
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
//    RegisterUsernameViewController *loginViewController = [[RegisterUsernameViewController alloc] initWithFlatNavigationBar];
//    [self.navigationController pushViewController:loginViewController animated:YES];
    
    LoginViewController *loginViewController = [[LoginViewController alloc] initWithFlatNavigationBar];
    [self.navigationController pushViewController:loginViewController animated:YES];
    
    
}

#pragma mark-delegate

-(void) pieChartButton:(PieChartButton *)pieChartButton didSelectButtonType:(PieChartType)pieChartType {
    DDLogInfo(@"pieChartType:%@", @(pieChartType));
}

@end

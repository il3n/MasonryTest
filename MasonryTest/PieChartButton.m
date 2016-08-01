//
//  PieChartButton.m
//  MasonryTest
//
//  Created by lijun on 16/8/1.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "PieChartButton.h"

@implementation PieChart

-(instancetype) initWithImageName:(NSString *)imageName raidus:(CGFloat)radius pieChartType:(PieChartType)pieChartType {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self p_setupSubviewsWithRadius:radius imageName:imageName pieChartType:pieChartType];
    }
    return self;
}

#pragma mark-setter

-(void) setSelected:(BOOL)selected {
    _selected = selected;
    [self p_resetSelected];
}

#pragma mark-private method

-(void) p_setupSubviewsWithRadius:(CGFloat)radius imageName:(NSString *)imageName pieChartType:(PieChartType)pieChartType {
    
    self.imageView.image = [UIImage imageNamed:imageName];
    _radius = radius;
    _pieChartType = pieChartType;
    
    self.defaultLayerColor = [UIColor colorWithHexRGB:kColorPieChartDefault];
    self.selectedLayerColor = [UIColor colorWithHexRGB:kColorPieChartSelect];
    
    [self.layer addSublayer:self.shapeLayer];
    [self addSubview:self.imageView];
}

-(void) p_redrawChart {
    
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    
    if (self.pieChartType == PieChartTypeLeft) {
        startAngle = M_PI*5/6.0;
        endAngle = M_PI*3/2.0;
    } else if (self.pieChartType == PieChartTypeRight) {
        startAngle = -M_PI_2;
        endAngle = M_PI/6.0;
    } else if (self.pieChartType == PieChartTypeBottom) {
        startAngle = M_PI/6.0;
        endAngle = M_PI*5/6.0;
    }
    
    self.shapeLayer.path = [self p_getBezierPathWithStartAngle:startAngle endAngle:endAngle].CGPath;
    [self p_resetSelected];
}

-(void) p_resetSelected {
    
    if (self.selected) {
        self.shapeLayer.fillColor = self.defaultLayerColor.CGColor;
    } else {
        self .shapeLayer.fillColor = self.selectedLayerColor.CGColor;
    }
}


-(UIBezierPath *) p_getBezierPathWithStartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath addArcWithCenter:self.center radius:self.radius-kMagicNumber5 startAngle:startAngle endAngle:endAngle clockwise:YES];
    [bezierPath addLineToPoint:self.center];
    return bezierPath;
}

#pragma mark-layout

-(void) layoutSubviews {
    [super layoutSubviews];
    
    self.shapeLayer.frame = self.layer.bounds;
    self.imageView.frame = self.bounds;
    
    [self p_redrawChart];
}

#pragma mark-getter

-(UIImageView *) imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.userInteractionEnabled = YES;
    }
    return _imageView;
}

-(CAShapeLayer *) shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [[CAShapeLayer alloc] init];
    }
    return _shapeLayer;
}

@end











@interface PieChartButton ()
@property (nonatomic, strong) CAShapeLayer *backgroundShapeLayer;

@property (nonatomic, strong) PieChart *leftChart;
@property (nonatomic, strong) PieChart *rightChart;
@property (nonatomic, strong) PieChart *bottomChart;

@property (nonatomic, copy, readonly) NSString *leftImageName;
@property (nonatomic, copy, readonly) NSString *rightImageName;
@property (nonatomic, copy, readonly) NSString *bottomImageName;

@property (nonatomic, strong) UIColor *backgroundLayerColor;

@end

@implementation PieChartButton

-(instancetype) initWithLeftImageName:(NSString *)leftImageName rightImageName:(NSString *)rightImageName bottomImageName:(NSString *)bottomImageName  radius:(CGFloat)radius {
    
    if (self = [super initWithFrame:CGRectZero]) {
        
        if (radius < kMagicNumber5) {
            radius = kMagicNumber5;
        }
        
        _radius = radius;
        _leftImageName = [leftImageName copy];
        _rightImageName = [rightImageName copy];
        _bottomImageName = [bottomImageName copy];
        
        [self p_setupSubviews];
    }
    
    return self;
}

-(void) setSelectedChartType:(PieChartType)selectedChartType {
    _selectedChartType = selectedChartType;
    [self p_resetSelectedPieChartType:selectedChartType];
}

#pragma mark-layout

-(void) layoutSubviews {
    
    [super layoutSubviews];
    
    self.backgroundShapeLayer.frame = self.layer.bounds;
    self.leftChart.frame = CGRectMake(-kMagicNumberDot5, -kMagicNumberDot5, self.layer.bounds.size.width, self.layer.bounds.size.height);
    self.rightChart.frame = CGRectMake(kMagicNumberDot5, -kMagicNumberDot5, self.layer.bounds.size.width, self.layer.bounds.size.height);
    self.bottomChart.frame = CGRectMake(0, kMagicNumberDot5, self.layer.bounds.size.width, self.layer.bounds.size.height);
    
    [self p_redrawBackgroundLayer];
}

#pragma mark-touch 

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint touchLocation = [touch locationInView:self];
        if (CGPathContainsPoint(self.leftChart.shapeLayer.path, 0, touchLocation, YES)) {
            [self p_chartPressed:self.leftChart];
        } else if (CGPathContainsPoint(self.rightChart.shapeLayer.path, 0, touchLocation, YES)) {
            [self p_chartPressed:self.rightChart];
        } else if (CGPathContainsPoint(self.bottomChart.shapeLayer.path, 0, touchLocation, YES)) {
            [self p_chartPressed:self.bottomChart];
        }
    }
}

#pragma mark-private method

-(void) p_setupSubviews {
    self.backgroundLayerColor = [UIColor colorWithHexRGB:kColorPieChartBackground];
    [self.layer addSublayer:self.backgroundShapeLayer];
    
    [self addSubview:self.leftChart];
    [self addSubview:self.rightChart];
    [self addSubview:self.bottomChart];
}

-(void) p_redrawBackgroundLayer {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath addArcWithCenter:self.center radius:self.radius startAngle:0 endAngle:2*M_PI clockwise:YES];
    _backgroundShapeLayer.path = bezierPath.CGPath;
}

-(void) p_resetSelectedPieChartType:(PieChartType)selectedPieChartType {
    self.leftChart.selected = NO;
    self.rightChart.selected = NO;
    self.bottomChart.selected = NO;
    
    if (selectedPieChartType == self.leftChart.pieChartType) {
        self.leftChart.selected = YES;
    } else if (selectedPieChartType == self.rightChart.pieChartType) {
        self.rightChart.selected = YES;
    } else if (selectedPieChartType == self.bottomChart.pieChartType) {
        self.bottomChart.selected = YES;
    }
}

-(void) p_chartPressed:(PieChart *)pieChart {
    if ([self.delegate respondsToSelector:@selector(pieChartButton:didSelectButtonType:)]) {
        PieChartType chartType = pieChart.pieChartType;
        [self p_resetSelectedPieChartType:chartType];
        [self.delegate pieChartButton:self didSelectButtonType:chartType];
    }
}

#pragma mark-getter

-(CAShapeLayer *) backgroundShapeLayer {
    if (!_backgroundShapeLayer) {
        _backgroundShapeLayer = [[CAShapeLayer alloc] init];
        _backgroundShapeLayer.fillColor = self.backgroundLayerColor.CGColor;
    }
    return _backgroundShapeLayer;
}

-(PieChart *) leftChart {
    if (!_leftChart) {
        _leftChart = [[PieChart alloc] initWithImageName:self.leftImageName raidus:self.radius pieChartType:PieChartTypeLeft];
    }
    return _leftChart;
}

-(PieChart *) rightChart {
    if (!_rightChart) {
        _rightChart = [[PieChart alloc] initWithImageName:self.rightImageName raidus:self.radius pieChartType:PieChartTypeRight];
    }
    return _rightChart;
}

-(PieChart *) bottomChart {
    if (!_bottomChart) {
        _bottomChart = [[PieChart alloc] initWithImageName:self.bottomImageName raidus:self.radius pieChartType:PieChartTypeBottom];
    }
    return _bottomChart;
}

@end


















//
//  PieChartButton.h
//  MasonryTest
//
//  Created by lijun on 16/8/1.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PieChartType) {
    
    PieChartTypeLeft,
    PieChartTypeRight,
    PieChartTypeBottom,
};




@class PieChartButton;

@protocol PieChartButtonDelegate <NSObject>
-(void) pieChartButton:(PieChartButton *)pieChartButton didSelectButtonType:(PieChartType)pieChartType;
@end

@interface PieChart : UIView

-(instancetype) initWithImageName:(NSString *)imageName raidus:(CGFloat)radius pieChartType:(PieChartType)pieChartType;

@property (nonatomic, assign, readonly) CGFloat radius;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign, readonly) PieChartType pieChartType;
@property (nonatomic, strong) UIColor *defaultLayerColor;
@property (nonatomic, strong) UIColor *selectedLayerColor;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, assign) BOOL selected;

@end



@interface PieChartButton : UIView

-(instancetype) initWithLeftImageName:(NSString *)leftImageName rightImageName:(NSString *)rightImageName bottomImageName:(NSString *)bottomImageName radius:(CGFloat)radius;

@property (nonatomic, weak) id<PieChartButtonDelegate>delegate;
@property (nonatomic, assign, readonly) CGFloat radius;
@property (nonatomic, assign) PieChartType selectedChartType;

@end

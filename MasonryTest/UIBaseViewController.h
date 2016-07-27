//
//  UIBaseViewController.h
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBaseViewController : UIViewController

/**
 *  初始化一个flat navigation bar的controller
 *  注意：
        如果初始化了这种controller，在布局的时候，需要把subview下移navigationBar高度
 
 *  @return
 */
-(instancetype) initWithFlatNavigationBar;


#pragma mark-inherit
-(void) i_setupSubviews;

@end

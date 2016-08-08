//
//  UIViewController+KeyboardEvent.h
//  MasonryTest
//
//  Created by lijun on 16/8/8.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

// 处理键盘弹出事件
#import <UIKit/UIKit.h>

@protocol KeyboardEventProtocol <NSObject>
@optional
-(BOOL) canHandleKeyboardEventAutomaticlly;
-(void) keyboardEvent:(UIView *)firstResponder offset:(CGFloat)offset;
@end


@interface UIViewController (KeyboardEvent)

-(void) addKeyboardEvent;
-(void) removeKeyboardEvent;

@property (nonatomic, weak) id<KeyboardEventProtocol>keyboardEventDelegate;

@end

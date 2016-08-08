//
//  UIViewController+KeyboardEvent.m
//  MasonryTest
//
//  Created by lijun on 16/8/8.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "UIViewController+KeyboardEvent.h"
#import "UIView+FindFirstResponder.h"
#import <objc/runtime.h>

@implementation UIViewController (KeyboardEvent)

-(void) addKeyboardEvent {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_gesture:)];
    [self.view addGestureRecognizer:tapGesture];
}

-(void) removeKeyboardEvent {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    for (UIGestureRecognizer *gesture in self.view.gestureRecognizers) {
        [self.view removeGestureRecognizer:gesture];
    }
}

#pragma mark-private method

-(void) p_keyboardWillChangeFrame:(NSNotification *)note {
//    if ([self.keyboardEventDelegate respondsToSelector:@selector(canHandleKeyboardEventAutomaticlly)]) {
//        BOOL canHandleKeyboardEvent = [self.keyboardEventDelegate canHandleKeyboardEventAutomaticlly];
//        if (canHandleKeyboardEvent) {
//
//        }
//    }

    UIView *firstResponder = [self.view findFirstResponder];
    if (firstResponder) {
        CGRect keyboardFrame = ((NSValue *)(note.userInfo[UIKeyboardFrameEndUserInfoKey])).CGRectValue;
        CGRect firstResponderFrame = [firstResponder.superview convertRect:firstResponder.frame toView:self.view];
        double animateDuration = ((NSNumber *)(note.userInfo[UIKeyboardAnimationDurationUserInfoKey])).doubleValue;

        CGRect beginUserInfo = [[note.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        if (beginUserInfo.size.height <= 0) {//!!搜狗输入法弹出时会发出三次UIKeyboardWillShowNotification的通知,和官方输入法相比,有效的一次为dUIKeyboardFrameBeginUserInfoKey.size.height都大于零时.
            return;
        }
        
        CGFloat offset = firstResponderFrame.origin.y+firstResponderFrame.size.height-keyboardFrame.origin.y;
        DDLogInfo(@"offset:%@", @(offset));
        offset = offset > 0 ? offset : 0;
        if ([self.keyboardEventDelegate respondsToSelector:@selector(keyboardEvent:offset:)]) {
            [self.keyboardEventDelegate keyboardEvent:firstResponder offset:offset];
        }
        
        [self.view setNeedsLayout];
        [UIView animateWithDuration:animateDuration animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}

-(void) p_gesture:(UITapGestureRecognizer *)gesture {
    [self.view endEditing:YES];
}

#pragma mark-setter

-(id<KeyboardEventProtocol>) keyboardEventDelegate {
    return objc_getAssociatedObject(self, @selector(keyboardEventDelegate));
}

-(void) setKeyboardEventDelegate:(id<KeyboardEventProtocol>)keyboardEventDelegate {
    objc_setAssociatedObject(self, @selector(keyboardEventDelegate), keyboardEventDelegate, OBJC_ASSOCIATION_ASSIGN);
}

@end

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_gesture:)];
    [self.view addGestureRecognizer:tapGesture];
}

-(void) removeKeyboardEvent {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
    for (UIGestureRecognizer *gesture in self.view.gestureRecognizers) {
        [self.view removeGestureRecognizer:gesture];
    }
}

#pragma mark-private method

//-(void) p_keyboardWillShow:(NSNotification *)note {
//    
//    self.keyboardYDelta = 0;
//}
//
//-(void) p_keyboardWillHide:(NSNotification *)note {
//    
//    self.keyboardYDelta = 0;
//}

-(void) p_keyboardWillChangeFrame:(NSNotification *)note {
//    if ([self.keyboardEventDelegate respondsToSelector:@selector(canHandleKeyboardEventAutomaticlly)]) {
//        BOOL canHandleKeyboardEvent = [self.keyboardEventDelegate canHandleKeyboardEventAutomaticlly];
//        if (canHandleKeyboardEvent) {
//
//        }
//    }

    UIView *firstResponder = [self.view findFirstResponder];
//    if (firstResponder) {
//        CGRect keyboardEndFrame = ((NSValue *)(note.userInfo[UIKeyboardFrameEndUserInfoKey])).CGRectValue;
//        CGRect keyboardBeginFrame = ((NSValue *)(note.userInfo[UIKeyboardFrameBeginUserInfoKey])).CGRectValue;
//        CGRect firstResponderFrame = [firstResponder.superview convertRect:firstResponder.frame toView:self.view];
//        double animateDuration = ((NSNumber *)(note.userInfo[UIKeyboardAnimationDurationUserInfoKey])).doubleValue;
//        
//        //!!搜狗输入法弹出时会发出三次UIKeyboardWillShowNotification的通知,和官方输入法相比,有效的一次为dUIKeyboardFrameBeginUserInfoKey.size.height都大于零时.
////        if (keyboardBeginFrame.size.height <= 0) {
////            return;
////        }
//        
//        DDLogInfo(@"keyboardFrame:%@, firstResponderFrame:%@", NSStringFromCGRect(keyboardEndFrame), NSStringFromCGRect(firstResponderFrame));
//        CGFloat offset = firstResponderFrame.origin.y+firstResponderFrame.size.height-keyboardEndFrame.origin.y;
//        offset = offset > 0 ? offset : 0;
//        self.keyboardYDelta += offset;
//        
//        DDLogInfo(@"offset:%@", @(offset));
// 
//
////        if ([self.keyboardEventDelegate respondsToSelector:@selector(keyboardEvent:offset:)]) {
////            [self.keyboardEventDelegate keyboardEvent:firstResponder offset:self.keyboardYDelta];
////        }
//        
////        [self.view setNeedsLayout];
//        //告诉约束他们需要更新
//        [self.view setNeedsUpdateConstraints];
//        //update constraints now
//        [self.view updateConstraintsIfNeeded];
//        
//        [UIView animateWithDuration:animateDuration animations:^{
//            [self.view layoutIfNeeded];
//        }];
//    }
}

-(void) p_gesture:(UITapGestureRecognizer *)gesture {
    
    [self.view endEditing:YES];
}

#pragma mark-setter

//-(id<KeyboardEventProtocol>) keyboardEventDelegate {
//    return objc_getAssociatedObject(self, @selector(keyboardEventDelegate));
//}
//
//-(void) setKeyboardEventDelegate:(id<KeyboardEventProtocol>)keyboardEventDelegate {
//    objc_setAssociatedObject(self, @selector(keyboardEventDelegate), keyboardEventDelegate, OBJC_ASSOCIATION_ASSIGN);
//}

@end

//
//  RichTextfield.h
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

// 自定义textfield，带有背景图片，icon
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RichTextfieldType) {
    
    RichTextfieldTypeUsername,
    RichTextfieldTypePassword,
};

@interface RichTextfield : UIView

-(instancetype) init NS_UNAVAILABLE;
-(instancetype) initWithFrame:(CGRect)frame NS_UNAVAILABLE;
-(instancetype) initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

-(instancetype) initWithRichTextFieldType:(RichTextfieldType)richTextfieldType;

@property (nonatomic, assign, readonly) RichTextfieldType type;

@end

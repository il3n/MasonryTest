//
//  RichTextfield.m
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "RichTextfield.h"

@interface RichTextfield ()
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIButton *toggleSecurityButton;
@end

@implementation RichTextfield

-(instancetype) initWithRichTextFieldType:(RichTextfieldType)richTextfieldType {
    if (self = [super init]) {
        _type = richTextfieldType;
        [self p_setupSubviews];
    }
    return self;
}

#pragma mark-private method

-(void) p_setupSubviews {
    
    NSString *imageName = @"";
    self.backgroundImageView.image = [UIImage imageNamed:imageName];
    
    NSString *iconImageName = nil;
    
    
    
    if (self.type == RichTextfieldTypeUsername) {
        iconImageName = @"";
    } else if (self.type == RichTextfieldTypePassword) {
        iconImageName = @"";
        self.textField.secureTextEntry = YES;
        self.toggleSecurityButton = [[UIButton alloc] init];
        [self.toggleSecurityButton addTarget:self action:@selector(p_buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.iconImageView.image = [UIImage imageNamed:iconImageName];
    
    
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.textField];
    [self addSubview:self.iconImageView];
    if (self.toggleSecurityButton) {
        [self addSubview:self.toggleSecurityButton];
    }
}

-(void) p_buttonPressed:(UIButton *)sender {
    self.textField.secureTextEntry = !self.textField.secureTextEntry;
}

#pragma mark-layout

-(void) layoutSubviews {
    [super layoutSubviews];

    [self.backgroundImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kMargin10);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.width.equalTo(@(kRichTextFieldIconWidth));
    }];
    
    [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(kMargin5);
        make.right.equalTo(self).offset(self.type == RichTextfieldTypePassword ? -(kMargin10*2+kRichTextFieldToggleSecurityButtonWidth) : -kMargin5);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    [self.toggleSecurityButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.textField.mas_right).offset(kMargin5);
        make.right.equalTo(self).offset(-kMargin5);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

#pragma mark-getter

-(UITextField *) textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.autocorrectionType = UITextAutocorrectionTypeNo;
        _textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _textField.spellCheckingType = UITextSpellCheckingTypeNo;
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.backgroundColor = [UIColor jk_randomColor];
    }
    return _textField;
}

-(UIImageView *) iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        _iconImageView.backgroundColor = [UIColor jk_randomColor];
    }
    return _iconImageView;
}

-(UIImageView *) backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
        _backgroundImageView.userInteractionEnabled = YES;
    }
    return _backgroundImageView;
}

@end

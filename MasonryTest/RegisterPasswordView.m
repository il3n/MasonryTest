//
//  RegisterPasswordView.m
//  MasonryTest
//
//  Created by lijun on 16/7/28.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "RegisterPasswordView.h"
#import "UILabel+Size.h"

@implementation RegisterPasswordView

#pragma mark-inhert

-(void) i_setupSubviews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.passwordField1];
    [self addSubview:self.passwordField2];
    [self addSubview:self.bottomLabel];
    [self addSubview:self.button];
}

#pragma mark-private method

-(void) p_buttonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(registerPasswordView:didPressedRegisterButton:)]) {
        [self.delegate registerPasswordView:self didPressedRegisterButton:sender];
    }
}

#pragma mark-layout

-(void) layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.preferredMaxLayoutWidth = self.bounds.size.width-2*kMargin10;
    CGSize labelSize = [self.titleLabel boundingRectWithSize:CGSizeMake(self.titleLabel.preferredMaxLayoutWidth, NSIntegerMax)];
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kMargin10);
        make.right.equalTo(self).offset(-kMargin10);
        make.top.equalTo(@(kMargin20));
        make.height.equalTo(@(ceil(labelSize.height)));
    }];

    [self.passwordField1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kMargin20);
        make.right.equalTo(self).offset(-kMargin20);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(kMargin20);
        make.height.equalTo(@(kMagicNumber40));
    }];

    [self.passwordField2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordField1);
        make.right.equalTo(self.passwordField1);
        make.top.equalTo(self.passwordField1.mas_bottom);
        make.height.equalTo(self.passwordField1);
    }];

    self.bottomLabel.preferredMaxLayoutWidth = self.bounds.size.width-2*kMargin10;
    CGSize bottomLabelSize = [self.bottomLabel boundingRectWithSize:CGSizeMake(self.bottomLabel.preferredMaxLayoutWidth, NSIntegerMax)];
    [self.bottomLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.titleLabel);
        make.top.equalTo(self.passwordField2.mas_bottom).offset(kMargin20);
        make.height.equalTo(@(ceil(bottomLabelSize.height)));
    }];
    
    [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordField2);
        make.right.equalTo(self.passwordField2);
        make.top.equalTo(self.bottomLabel.mas_bottom).offset(kMargin20);
        make.height.equalTo(@(kButtonHeightDefault));
    }];
}

#pragma mark-getter

-(UILabel *) titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        _titleLabel.backgroundColor = [UIColor jk_randomColor];
        _titleLabel.text = @"titleLabel";
        _titleLabel.font = [UIFont systemFontOfSize:kFontSize15];
    }
    return _titleLabel;
}

-(UILabel *) bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        _bottomLabel.numberOfLines = 0;
        _bottomLabel.backgroundColor = [UIColor jk_randomColor];
        _bottomLabel.text = @"bottomLabel";
        _bottomLabel.font = [UIFont systemFontOfSize:kFontSize13];
    }
    return _bottomLabel;
}

-(UIButton *) button {
    
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button addTarget:self action:@selector(p_buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _button.titleLabel.textAlignment = NSTextAlignmentCenter;
        _button.backgroundColor = [UIColor jk_randomColor];
    }
    
    return _button;
}

-(RichTextfield *) passwordField1 {
    if (!_passwordField1) {
        _passwordField1 = [[RichTextfield alloc] initWithRichTextFieldType:RichTextfieldTypePassword];
        _passwordField1.backgroundColor = [UIColor jk_randomColor];
    }
    return _passwordField1;
}

-(RichTextfield *) passwordField2 {
    if (!_passwordField2) {
        _passwordField2 = [[RichTextfield alloc] initWithRichTextFieldType:RichTextfieldTypePassword];
        _passwordField2.backgroundColor = [UIColor jk_randomColor];
    }
    return _passwordField2;
}

@end

//
//  LoginView.m
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "RegisterUsernameView.h"
#import "UILabel+Size.h"

@interface RegisterUsernameView ()
@end

@implementation RegisterUsernameView

#pragma mark-inhert

-(void) i_setupSubviews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.usernameField];
    [self addSubview:self.button];
    [self addSubview:self.bottomLabel];
}

#pragma mark-private method

-(void) p_buttonPressed:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(registerUsernameView:didPressedRegisterButton:)]) {
        [self.delegate registerUsernameView:self didPressedRegisterButton:sender];
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
    
    [self.usernameField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kMargin20);
        make.right.equalTo(self).offset(-kMargin20);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(kMargin20);
        make.height.equalTo(@(kMagicNumber40));
    }];
    
    [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kMargin20);
        make.right.equalTo(self).offset(-kMargin20);
        make.top.equalTo(self.usernameField.mas_bottom).offset(kMargin20);
        make.height.equalTo(@(kButtonHeightDefault));
    }];
    
    
    self.bottomLabel.preferredMaxLayoutWidth = self.bounds.size.width-2*kMargin10;
    CGSize bottomLabelSize = [self.bottomLabel boundingRectWithSize:CGSizeMake(self.bottomLabel.preferredMaxLayoutWidth, NSIntegerMax)];
    [self.bottomLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kMargin10);
        make.right.equalTo(self).offset(-kMargin10);
        make.top.equalTo(self.button.mas_bottom).offset(kMargin10);
        make.height.equalTo(@(ceil(bottomLabelSize.height)));
    }];
}

#pragma mark-getter

-(UIButton *) button {
    
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button addTarget:self action:@selector(p_buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _button.titleLabel.textAlignment = NSTextAlignmentCenter;
        _button.backgroundColor = [UIColor jk_randomColor];
    }
    
    return _button;
}

-(RichTextfield *) usernameField {
    if (!_usernameField) {
        _usernameField = [[RichTextfield alloc] initWithRichTextFieldType:RichTextfieldTypePassword];
        _usernameField.backgroundColor = [UIColor jk_randomColor];
    }
    return _usernameField;
}

-(UILabel *) titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        _titleLabel.backgroundColor = [UIColor jk_randomColor];
        _titleLabel.text = @"titleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabeltitleLabel";
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
        _bottomLabel.text = @"bottomtitleLabeltitleLabeltitleLabeltitleLabeltitleLabelLabel";
        _bottomLabel.font = [UIFont systemFontOfSize:kFontSize13];
    }
    return _bottomLabel;
}

@end

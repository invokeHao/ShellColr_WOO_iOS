//
//  WOOPhoneLoginView.m
//  wooDemo
//
//  Created by colr on 2018/12/10.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOPhoneLoginView.h"
#import "WOOTimerButton.h"
#import "WOOLoginService.h"

@interface WOOPhoneLoginView()<UITextFieldDelegate>

@property (nonatomic, strong) UIView * phoneNumberContentView;
@property (nonatomic, strong) UIImageView * phoneIconV;
@property (nonatomic, strong) UITextField * phoneField;
@property (nonatomic, strong) UIView * phoneBottomLine;

@property (nonatomic, strong) UIView * valideCodeContentView;
@property (nonatomic, strong) UIImageView * codeIconV;
@property (nonatomic, strong) UITextField * valideCodeTextField;
@property (nonatomic, strong) WOOTimerButton *sendValideCodeButton;
@property (nonatomic, strong) UIView * codeBottomLine;

@property (nonatomic, strong) WOOValidCode *codeModel;

@end

@implementation WOOPhoneLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        [self layoutViews];
        [self bindEvents];
    }
    return self;
}

- (void)setupViews {
    [self addSubviewArray:@[self.phoneNumberContentView, self.valideCodeContentView]];
    [self.phoneNumberContentView addSubview:self.phoneIconV];
    [self.phoneNumberContentView addSubview:self.phoneField];
    [self.phoneNumberContentView addSubview:self.phoneBottomLine];
    
    [self.valideCodeContentView addSubviewArray:@[self.codeIconV,self.valideCodeTextField,self.sendValideCodeButton,self.codeBottomLine]];
}

- (void)layoutViews {
    [self.phoneNumberContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    [self.valideCodeContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneNumberContentView.mas_bottom).offset(0);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    [self.phoneIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.mas_equalTo(self.phoneNumberContentView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.phoneIconV.mas_right).offset(10);
        make.centerY.mas_equalTo(self.phoneNumberContentView);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
    [self.phoneBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(49);
        make.height.mas_equalTo(1);
    }];
    
    [self.codeIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.mas_equalTo(self.valideCodeContentView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.valideCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(self.phoneField);
        make.centerY.mas_equalTo(self.valideCodeContentView);
    }];
    
    [self.sendValideCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(self.valideCodeContentView);
        make.size.mas_equalTo(CGSizeMake(98, 32));
    }];
    
    [self.codeBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    self.sendValideCodeButton.layer.cornerRadius = 16;
    self.sendValideCodeButton.layer.borderColor = woo_colorWithHexString(@"#4F4F4F").CGColor;
    self.sendValideCodeButton.layer.borderWidth = 0.5;
}

- (void)bindEvents {
    [self.sendValideCodeButton addTarget:self action:@selector(sendValitedCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    @weakify(self)
    [[self.valideCodeTextField rac_textSignal] subscribeNext:^(NSString * code) {
        @strongify(self);
        if (code.length == 6) {
            [self loginWOO];
        }
    }];
}

- (void)sendValitedCodeAction:(WOOTimerButton *)button {
    if (![self.valideCodeTextField isFirstResponder]) {
        [self.valideCodeTextField becomeFirstResponder];
    }
    if (self.phoneField.text.length != 11) {
        [WOOHud showString:@"手机号格式错误"];
        return;
    }
    [button startTimer];
    [WOOHud showString:@"验证码已发送"];
    [WOOLoginService postForCodeToPhoneNumber:self.phoneField.text completion:^(WOOValidCode *validCode, NSError *error) {
        if (error) {
            if (error.code == 0) {
                [WOOHud showString:@"此号码已达到今日上限，请明天再来"];
            } else {
                [WOOHud showString:error.descriptionFromServer];
            }
        } else {
            self.codeModel = validCode;
        }
    }];
}

- (void)loginWOO {
    if (self.phoneField.text.length != 11) {
        [WOOHud showString:@"手机号格式不正确"];
        return;
    }
    if (self.valideCodeTextField.text.length != 6) {
        [WOOHud showString:@"验证码格式不正确"];
        return;
    }
    [WOOLoginService loginWithPhoneNumber:self.phoneField.text code:self.valideCodeTextField.text completion:^(WOOLoginModel * _Nonnull loginModel, NSError * _Nonnull error) {
        if (loginModel) {
            [WOOLoginManager sharedManager].userLoginModel = loginModel;
            [[WOOAlertTool WHTopViewController] dismissViewControllerAnimated:YES completion:NULL];
        }
    }];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == self.phoneField) {
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        return newLength <= 11 || returnKey;
    }
    if (textField == self.valideCodeTextField) {
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        return newLength <= 6 || returnKey;
    }
    return NO;
}


-(UIView *)phoneNumberContentView {
    if (!_phoneNumberContentView) {
        _phoneNumberContentView = [[UIView alloc]init];
    }
    return _phoneNumberContentView;
}

- (UIView *)valideCodeContentView {
    if (!_valideCodeContentView) {
        _valideCodeContentView = [[UIView alloc]init];
    }
    return _valideCodeContentView;
}

- (UIImageView *)phoneIconV {
    if (!_phoneIconV) {
        _phoneIconV = UIImageView.imageView.WH_image(WOOImageNamed(@"phone"));
    }
    return _phoneIconV;
}

- (UIView *)phoneBottomLine {
    if (!_phoneBottomLine) {
        _phoneBottomLine = [[UIView alloc]init];
        _phoneBottomLine.backgroundColor = woo_colorWithHexString(@"4F4F4F");
    }
    return _phoneBottomLine;
}

- (UIImageView *)codeIconV {
    if (!_codeIconV) {
        _codeIconV = UIImageView.imageView.WH_image(WOOImageNamed(@"message"));
    }
    return _codeIconV;
}

- (UIView *)codeBottomLine {
    if (!_codeBottomLine) {
        _codeBottomLine = [[UIView alloc]init];
        _codeBottomLine.backgroundColor = woo_colorWithHexString(@"4F4F4F");
    }
    return _codeBottomLine;
}

- (WOOTimerButton *)sendValideCodeButton {
    if (!_sendValideCodeButton) {
        _sendValideCodeButton = [[WOOTimerButton alloc]initWithCountDownTime:60];
        _sendValideCodeButton.title = @"获取验证码";
        _sendValideCodeButton.normalColor = woo_colorWithHexString(@"#4F4F4F");
        _sendValideCodeButton.disableTitle = @"重新获取";
        _sendValideCodeButton.disableColor = woo_colorWithHexString(@"#6D88FE");
        [_sendValideCodeButton.titleLabel setFont:WOOFont(14)];
    }
    return _sendValideCodeButton;
}

- (UITextField *)phoneField {
    if (!_phoneField) {
        _phoneField = [[UITextField alloc] init];
        _phoneField.font = WOOFont(14);
        _phoneField.textColor = woo_colorWithHexString(@"4F4F4F");
        _phoneField.delegate = self;
        _phoneField.keyboardType = UIKeyboardTypePhonePad;
        _phoneField.returnKeyType = UIReturnKeyDone;
        _phoneField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入手机号"
                                                                                 attributes:@{NSForegroundColorAttributeName:woo_colorWithHexString(@"#9B9B9B")}];
    }
    return _phoneField;
}

- (UITextField *)valideCodeTextField {
    if (!_valideCodeTextField) {
        _valideCodeTextField = [[UITextField alloc] init];
        _valideCodeTextField.font = WOOFont(14);
        _valideCodeTextField.delegate = self;
        _valideCodeTextField.keyboardType = UIKeyboardTypePhonePad;
        _valideCodeTextField.returnKeyType = UIReturnKeyDone;
        _valideCodeTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"短信验证码"
                                                                            attributes:@{NSForegroundColorAttributeName:woo_colorWithHexString(@"#9B9B9B")}];
    }
    return _valideCodeTextField;
}



@end

//
//  WOOOrderDetailTopView.m
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOOrderDetailTopCell.h"

@interface WOOOrderDetailTopCell()

@property (nonatomic, strong)UIImageView * iconView;

@property (nonatomic, strong)UILabel * tipsLabel;

@property (nonatomic, strong)UIButton * payBtn;

@end

@implementation WOOOrderDetailTopCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubviewArray:@[self.iconView,self.tipsLabel,self.payBtn]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(44);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    CGFloat textW = VERTICAL_SCREEN_WIDTH - W_SCALE(128);
    
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_bottom).offset(20);
        make.centerX.mas_equalTo(self.contentView);
        make.width.mas_equalTo(textW);
    }];
    
    [self.payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tipsLabel.mas_bottom).offset(24);
        make.size.mas_equalTo(CGSizeMake(278, 52));
        make.centerX.mas_equalTo(self.iconView);
    }];
}

- (void)setOrderType:(WOOOrderStatusType)OrderType {
    self.iconView.image = WOOImageNamed(@"shoppingCat");
    NSString * tipStr = nil;
    switch (OrderType) {
        case WOOOrderStatusTypeDefault:
            tipStr = @"注意力订单将在订单生成48小时后自动取消";
            break;
        case WOOOrderStatusTypePayed:
            tipStr = @"正在与商家确认是否成功付款指定商品，预计成功付费后一个工作日完成确认";
            break;
        case WOOOrderStatusTypeSended:
            tipStr = @"正在与第三方商家确认是否收货并完成交易，预计成功收获后1-3个工作日完成确认";
            break;
        case WOOOrderStatusTypeCancel:
            tipStr = @"未能确认成功付款指定商品，订单自动取消，注意力将全部退还";
            break;
        case WOOOrderStatusTypeCompleted:
            tipStr = @"订单已完成";
            break;
        default:
            break;
    }
    self.tipsLabel.text = tipStr;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = UIImageView.imageView;
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconView;
}

- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel = UILabel.label.WH_textColor(woo_colorWithHexString(@"#4F4F4F")).WH_font(WOOFont(12)).WH_numberOfLines(0).WH_textAlignment(NSTextAlignmentCenter);
    }
    return _tipsLabel;
}

- (UIButton *)payBtn {
    if (!_payBtn) {
        _payBtn = UIButton.button.WH_setTitle_forState(@"现在支付",UIControlStateNormal).WH_setTitleColor_forState([UIColor whiteColor],UIControlStateNormal);
        _payBtn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        _payBtn.backgroundColor = woo_colorWithHexString(@"#3A3A3A");
        _payBtn.layer.cornerRadius = 26;
    }
    return _payBtn;
}

- (void)setFrame:(CGRect)frame {
    frame.origin.y += 8;
    frame.size.height -= 8;
    [super setFrame:frame];
}

@end

//
//  WOOGoodsDetailCashBackView.m
//  wooDemo
//
//  Created by colr on 2018/11/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOGoodsDetailCashBackView.h"
#import "WOORewardService.h"

@interface WOOGoodsDetailCashBackView()

@property (nonatomic, strong)UILabel * titleLabel;

@property (nonatomic, strong)UILabel * cashBackLabel;

@property (nonatomic, strong)UILabel * consumeGoldLabel;//消费金币

@property (nonatomic, strong)UILabel * leftgoldLabel; //剩下金币

@property (nonatomic, strong)UISlider * cashSlider; //返现滑杆

@property (nonatomic, strong)UIButton * goToWishListBtn;// 加入购物袋

@property (nonatomic, strong)UIButton * goShoppingBtn; //立即购买

@property (nonatomic, assign)CGFloat myTotalGolg; //我的总金币

@property (nonatomic, assign)NSInteger expenseMoney;

@end

@implementation WOOGoodsDetailCashBackView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.myTotalGolg = 100000000;
        self.expenseMoney = 0;
        [self setupView];
        [self bindingEvents];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.titleLabel];
    [self addSubview:self.cashBackLabel];
    [self addSubview:self.cashSlider];
    [self addSubview:self.consumeGoldLabel];
    [self addSubview:self.leftgoldLabel];
    [self addSubview:self.goToWishListBtn];
    [self addSubview:self.goShoppingBtn];
}

- (void)bindingEvents {
    self.rewardSubject = [WOOStreamFactory exportFetchSubject];
    @weakify(self)
    [[self.goToWishListBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        @strongify(self)
//        [WOOHud showString:@"加入购物袋"];
    }];
    
    [[self.goShoppingBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        [self postTheReward];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(15);
    }];
    
    [self.cashBackLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(37);
    }];
    
    [self.consumeGoldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.cashBackLabel);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(13);
    }];
    
    [self.leftgoldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.consumeGoldLabel);
        make.bottom.mas_equalTo(self.cashBackLabel);
        make.height.mas_equalTo(self.consumeGoldLabel);
    }];
    
    [self.cashSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.top.mas_equalTo(self.cashBackLabel.mas_bottom).offset(30);
        make.height.mas_equalTo(20);
    }];
    CGFloat btnWidth = (VERTICAL_SCREEN_WIDTH - (48 * 2))/2;
    [self.goToWishListBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(48);
        make.bottom.mas_equalTo(-27);
        make.size.mas_equalTo(CGSizeMake(btnWidth, 48));
    }];
    
    [self.goShoppingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-48);
        make.bottom.mas_equalTo(self.goToWishListBtn);
        make.size.mas_equalTo(self.goToWishListBtn);
    }];
    
    self.layer.cornerRadius = 18;
    self.clipsToBounds = YES;
    
    [self.goToWishListBtn roundCorner:UIRectCornerTopLeft|UIRectCornerBottomLeft radius:24];
    [self.goShoppingBtn roundCorner:UIRectCornerTopRight|UIRectCornerBottomRight radius:24];
}

- (void)setModel:(WOOGoodsModel *)model {
    if (model) {
        _model = model;
        _cashSlider.maximumValue = (float)model.productPriceAmount;// 设置最大值
        _cashSlider.value = model.productCommissionAmount;// 设置初始值
        [self showLabelWithCashBackMoney:model.productCommissionAmount];
    }
}

- (void)sliderValueChanged:(UISlider *)slider {
    NSInteger cashBackMoney = [FORMAT(@"%.0f",slider.value) integerValue];
    [self showLabelWithCashBackMoney:cashBackMoney];
}

- (void)showLabelWithCashBackMoney:(NSInteger)cashBackMoney {
    NSString * cashbackStr = FORMAT(@"返现%ld元",cashBackMoney);
    self.cashBackLabel.text = cashbackStr;
    
    self.expenseMoney = [self getExpenseMoneyWithCashBackMoney:cashBackMoney];
    NSInteger leftMoney = self.myTotalGolg - self.expenseMoney;
    self.leftgoldLabel.textColor = leftMoney > 0 ? woo_colorWithHexString(@"#868686") : woo_colorWithHexString(@"#EB5E6E");
    //将数据单位化
    NSString * expenseMoneyStr = [self unitTheMoney:self.expenseMoney];
    NSString * leftMoneyStr = [self unitTheMoney:leftMoney];
    
    self.consumeGoldLabel.text = FORMAT(@"消耗%@",expenseMoneyStr);
    
    NSString * resultStr = FORMAT(@"剩余%@",leftMoneyStr);
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc]initWithString:resultStr];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = WOOFont(12);
    attrs[NSForegroundColorAttributeName] = woo_colorWithHexString(@"EB5E6E");
    
    NSRange rang = [resultStr rangeOfString:leftMoneyStr];
    
    [attrStr addAttributes:attrs range:rang];

    self.leftgoldLabel.attributedText = attrStr;
}

- (CGFloat)getExpenseMoneyWithCashBackMoney:(NSInteger)cashBackMoney {
    CGFloat targetMoney = self.model.productCommissionAmount;
    CGFloat expenseMoney = 0;
    if (cashBackMoney < targetMoney) {
        expenseMoney = cashBackMoney * 10000;
    }else{
        expenseMoney = ((cashBackMoney - targetMoney) * 100000) + (targetMoney * 10000);
    }
    return expenseMoney;
}

- (NSString *)unitTheMoney:(NSInteger)money {
    BOOL isPostive = YES;
    if (money < 0) {
        isPostive = NO;
    }
    money = (NSInteger)abs((int)money);
    if (money < 10000) {
        if (!isPostive) {
            return FORMAT(@"-%ld",money);
        }
        return FORMAT(@"%ld",money);
    }else{
        if (money % 10000 == 0) {
            NSInteger moneyNum = money / 10000;
            if (!isPostive) {
                return FORMAT(@"-%ldW",moneyNum);
            }
            return FORMAT(@"%ldW",moneyNum);
        }else{
            CGFloat moneyNum = money / 10000;
            if (!isPostive) {
                return FORMAT(@"-%.1fW",moneyNum);
            }
            return FORMAT(@"%.1fW",moneyNum);
        }
    }
}

- (void)postTheReward {
    if (!self.model) {return;}
    NSDictionary * paramDic = @{@"articleId":self.model.articleId , @"coinAmount" : @(self.expenseMoney)};
    [WOOHud showActivityView];
    [WOORewardService postARewardWithParamDic:paramDic completion:^(WOORewardRow * _Nonnull row, NSError * _Nonnull error) {
        [WOOHud hideActivityView];
        if (row) {
            [self.rewardSubject sendNext:row];
        }
    }];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.label.WH_font(WOOFont(14)).WH_textColor(woo_colorWithHexString(@"222222")).WH_text(@"使用注意力返现");
    }
    return _titleLabel;
}

- (UILabel *)cashBackLabel {
    if (!_cashBackLabel) {
        _cashBackLabel = UILabel.label.WH_font(WOOFont(18)).WH_textColor(woo_colorWithHexString(@"4f4f4f"));
    }
    return _cashBackLabel;
}

- (UILabel *)consumeGoldLabel {
    if (!_consumeGoldLabel) {
        _consumeGoldLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"868686"));
    }
    return _consumeGoldLabel;
}

- (UILabel *)leftgoldLabel {
    if (!_leftgoldLabel) {
        _leftgoldLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"868686"));
    }
    return _leftgoldLabel;
}

- (UISlider *)cashSlider {
    if (!_cashSlider) {
        _cashSlider = [[UISlider alloc]init];
        _cashSlider.minimumValue = 0;// 设置最小值
        _cashSlider.minimumTrackTintColor = woo_colorWithHexString(@"B3E220"); //滑轮左边颜色
        _cashSlider.maximumTrackTintColor = woo_colorWithHexString(@"F2F2F2"); //滑轮右边颜色，如果设置了右边的图片就不会显示
        //    slider.thumbTintColor = [UIColor redColor];//设置了滑轮的颜色，如果设置了滑轮的样式图片就不会显示
        [_cashSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _cashSlider;
}

- (UIButton *)goToWishListBtn {
    if (!_goToWishListBtn) {
        _goToWishListBtn = UIButton.button;
        _goToWishListBtn.backgroundColor = [UIColor blackColor];
        [_goToWishListBtn setTitle:@"放入购物袋" forState:UIControlStateNormal];
        [_goToWishListBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_goToWishListBtn.titleLabel setFont:WOOFont(13)];
        _goToWishListBtn.clipsToBounds = YES;
    }
    return _goToWishListBtn;
}

- (UIButton *)goShoppingBtn {
    if (!_goShoppingBtn) {
        _goShoppingBtn = UIButton.button;
        _goShoppingBtn.backgroundColor = woo_colorWithHexString(@"B3E220");
        [_goShoppingBtn setTitle:@"现在使用" forState:UIControlStateNormal];
        [_goShoppingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_goShoppingBtn.titleLabel setFont:WOOFont(13)];
        _goShoppingBtn.clipsToBounds = YES;
    }
    return _goShoppingBtn;
}

@end

//
//  WOOMineTopUserView.m
//  wooDemo
//
//  Created by colr on 2018/12/11.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOMineTopUserView.h"

@interface WOOMineTopUserView()

@property (nonatomic, strong)UIView * backView;

@property (nonatomic, strong)YYAnimatedImageView * IconView;

@property (nonatomic, strong)UILabel * nameLabel;

@property (nonatomic, strong)UILabel * infoLabel;
@end

@implementation WOOMineTopUserView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.loginSubject = [RACSubject subject];
        [self setupViews];
        [self bindEvents];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.backView];
    [self.backView addSubviewArray:@[self.IconView,self.nameLabel,self.infoLabel]];
}

- (void)bindEvents {
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]init];
    [self addGestureRecognizer:tap];
    @weakify(self)
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        @strongify(self)
        if (!self.model) {
            //去登录
            [self.loginSubject sendNext:@"WOOLogin"];
        }
        [self.loginSubject sendNext:@"WOOLogin"];
    }];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(278, 75));
    }];
    [self.IconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(75, 75));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.IconView.mas_right).offset(15);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-15);
    }];
    
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel);
        make.right.mas_equalTo(self.nameLabel);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(8);
    }];
}

- (void)setModel:(WOOProfile *)model {
    _model = model;
    if (model) {
        NSString * iconStr = model.headIcon.url;
        [self.IconView yy_setImageWithURL:[NSURL URLWithString:iconStr] options:YYWebImageOptionProgressive];
        [self.nameLabel setText:model.nickname];
        [self.infoLabel setText:@"保密 | 保密 | 保密"];
    }else{
        [self.IconView setImage:WOOImageNamed(@"defaultUser")];
        self.nameLabel.text = @"请点击登录";
        self.infoLabel.text = nil;
    }
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc]init];
    }
    return _backView;
}

- (YYAnimatedImageView *)IconView {
    if (!_IconView) {
        _IconView = [[YYAnimatedImageView alloc]init];
        _IconView.contentMode = UIViewContentModeScaleAspectFit;
        _IconView.backgroundColor = woo_colorWithHexString(@"D8D8D8");
        _IconView.clipsToBounds = YES;
        _IconView.layer.cornerRadius = 37;
    }
    return _IconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = UILabel.label.WH_font(WOOFont(24)).WH_textColor(woo_colorWithHexString(@"333333")).WH_textAlignment(NSTextAlignmentCenter);
    }
    return _nameLabel;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"#8E8E8E")).WH_textAlignment(NSTextAlignmentCenter);
    }
    return _infoLabel;
}


@end

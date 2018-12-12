//
//  WOONewGoodsCell.m
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOONewGoodsCell.h"

@interface WOONewGoodsCell()

@property (nonatomic, strong)UILabel * priceLabel;

@property (nonatomic, strong)YYAnimatedImageView * coverImageV;

@property (nonatomic, strong)UIImageView * iconView;

@property (nonatomic, strong)UILabel * descLabel; //描述label

@end

@implementation WOONewGoodsCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.coverImageV];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.descLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat KTopH = 135 * VERTICAL_SCREEN_WIDTH / 375;
    [self.coverImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(KTopH);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(4);
        make.right.mas_equalTo(-4);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.coverImageV.mas_bottom).offset(9);
        make.left.mas_equalTo(14);
        make.right.mas_equalTo(-14);
    }];
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.priceLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(14);
        make.right.mas_equalTo(-14);
    }];
    [self configTheLayer];
}

- (void)configTheLayer {
    [self.coverImageV roundCorner:UIRectCornerTopLeft|UIRectCornerTopRight radius:5];
    self.layer.cornerRadius = 5;
    self.layer.shadowOffset = CGSizeMake(0, 10);
    self.layer.shadowColor = woo_colorWithHexAndAlpha(@"000000", 0.1).CGColor;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 5;
}


-(void)setModel:(WOOGoodsModel *)model {
    if (model) {
        WOOImage * image = [model.multiBodyText.images firstObject];
        [self.coverImageV yy_setImageWithURL:[NSURL URLWithString:image.url] options:YYWebImageOptionProgressive];
        NSString * priceStr = FORMAT(@"¥%ld",model.productPriceAmount);
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = 1.5f;

        NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc]initWithString:priceStr attributes:@{NSParagraphStyleAttributeName: style}];
        
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = WOOFont(10);
        attrs[NSForegroundColorAttributeName] = woo_colorWithHexString(@"#4F4F4F");

        NSRange rang1 = [priceStr rangeOfString:@".00"];
        [attrStr addAttributes:attrs range:rang1];

        self.priceLabel.attributedText = attrStr;
        self.descLabel.attributedText = [model.title attributedStringWithLineSpace:1.5 fontSpace:0.0f];
        self.descLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _model = model;
    }
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = UILabel.label.WH_font(WOOMFont(15)).WH_textColor(woo_colorWithHexString(@"#4F4F4F"));
    }
    return _priceLabel;
}

- (UILabel *)descLabel {
    if (!_descLabel) {
        _descLabel = UILabel.label.WH_font(WOOMFont(15)).WH_textColor(woo_colorWithHexString(@"#171F24")).WH_numberOfLines(2);
    }
    return _descLabel;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = UIImageView.imageView;
        _iconView.image = [UIImage imageNamed:@"shop"];
    }
    return _iconView;
}

- (YYAnimatedImageView *)coverImageV {
    if (!_coverImageV) {
        _coverImageV = [[YYAnimatedImageView alloc]init];
        _coverImageV.contentMode = UIViewContentModeScaleAspectFill;
        _coverImageV.backgroundColor = woo_colorWithHexString(@"D8D8D8");
        _coverImageV.clipsToBounds = YES;
    }
    return _coverImageV;
}

@end

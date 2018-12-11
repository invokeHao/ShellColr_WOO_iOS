//
//  WOONewListTopCell.m
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOONewListTopCell.h"

@interface WOONewListTopCell ()

@property (strong, nonatomic)YYAnimatedImageView * coverImageV;

@property (strong, nonatomic)UIImageView * iconView;

@property (strong, nonatomic)UILabel * titleLabel;

@end

@implementation WOONewListTopCell

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
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
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
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.coverImageV.mas_bottom).offset(14);
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


- (void)setModel:(WOOArticleModel *)model {
    if (model) {
        NSString * imageUrlStr = model.large_image ? model.large_image : model.middle_image;
        [self.coverImageV yy_setImageWithURL:[NSURL URLWithString:imageUrlStr] options:YYWebImageOptionProgressive];
        self.titleLabel.attributedText = [model.title attributedStringWithLineSpace:1.5 fontSpace:0.0f];
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        if (model.has_video) {
            [self.iconView setImage:[UIImage imageNamed:@"play_button"]];
        }else {
            [self.iconView setImage:[UIImage imageNamed:@"article"]];
        }
        if (model.isBigCell) {
            [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(10);
            }];
        }
    }
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

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = UIImageView.imageView;
        _iconView.alpha = 0.8;
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.label.WH_font(WOOMFont(15)).WH_textColor(woo_colorWithHexString(@"#171F24")).WH_numberOfLines(3);
    }
    return _titleLabel;
}

//-(void)drawRect:(CGRect)rect{
//    //根据需求
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //// Color Declarations
//    UIColor* color = woo_colorWithHexAndAlpha(@"000000", 0.1);
//    //// Shadow Declarations
//    NSShadow* shadow2 = [[NSShadow alloc] init];
//    shadow2.shadowColor = color;
//    shadow2.shadowOffset = CGSizeMake(0, 10);
//    shadow2.shadowBlurRadius = 5;
//
//    //// Rectangle Drawing
//    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: self.frame cornerRadius: 5];
//    CGContextSaveGState(context);
//    CGContextSetShadowWithColor(context, shadow2.shadowOffset, shadow2.shadowBlurRadius, [shadow2.shadowColor CGColor]);
//    [color setFill];
//    [rectanglePath fill];
//    CGContextRestoreGState(context);
//}


@end

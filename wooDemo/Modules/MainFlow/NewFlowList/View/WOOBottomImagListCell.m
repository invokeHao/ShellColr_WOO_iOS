//
//  WOOBottomImagListCell.m
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBottomImagListCell.h"

@interface WOOBottomImagListCell ()

@property (strong, nonatomic)UILabel * titleLabel;

@property (strong, nonatomic)UIView * imageBackView; //图片背景view

@end

@implementation WOOBottomImagListCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.imageBackView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat KTopH = 97 * VERTICAL_SCREEN_WIDTH / 375;
    [self.imageBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(KTopH);
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageBackView.mas_bottom).offset(15);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
    }];
    [self configTheLayer];
}

- (void)setModel:(WOOArticleModel *)model {
    if (model) {
        self.titleLabel.attributedText = [model.title attributedStringWithLineSpace:1.5f fontSpace:0.0f];
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        if (model.image_list.count > 0) {
            [self imageBackViewSetImages:model.image_list];
        }
    }
}

- (void)imageBackViewSetImages:(NSArray*)images {
    CGFloat margin = 1;
    CGFloat KTopH = 97 * VERTICAL_SCREEN_WIDTH / 375;
    CGFloat width = (self.contentView.width - 2*margin) / images.count;
    int  i = 0;
    for (NSDictionary * imageDic in images) {
        YYAnimatedImageView * imageV = [[YYAnimatedImageView alloc]init];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        imageV.clipsToBounds = YES;
        imageV.backgroundColor = woo_colorWithHexString(@"D8D8D8");
        [imageV yy_setImageWithURL:[NSURL URLWithString:imageDic[@"url"]] options:YYWebImageOptionProgressive];
        [imageV setFrame:CGRectMake(i*(width+margin), 0, width, KTopH)];
        [self.imageBackView addSubview:imageV];
        i++;
    }
}

-(void)prepareForReuse {
    [self.imageBackView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[YYAnimatedImageView class]]) {
            [obj removeFromSuperview];
        }
    }];
}

- (void)configTheLayer {
    [self.imageBackView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[YYAnimatedImageView class]]) {
            YYAnimatedImageView * imageV = obj;
            if (idx == 0) {
                [imageV roundCorner:UIRectCornerTopLeft radius:7];
            }else if (idx == 2){
                [imageV roundCorner:UIRectCornerTopRight radius:7];
            }
        }
    }];
    self.layer.cornerRadius = 7;
    self.layer.shadowOffset = CGSizeMake(0, 10);
    self.layer.shadowColor = woo_colorWithHexAndAlpha(@"000000", 0.1).CGColor;
    self.layer.shadowOpacity = 0.2;
    self.layer.shadowRadius = 5;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.label.WH_font(WOOMFont(16)).WH_textColor(woo_colorWithHexString(@"#171F24")).WH_numberOfLines(2);
    }
    return _titleLabel;
}

- (UIView *)imageBackView {
    if (!_imageBackView) {
        _imageBackView = [[UIView alloc]init];
    }
    return _imageBackView;
}

@end

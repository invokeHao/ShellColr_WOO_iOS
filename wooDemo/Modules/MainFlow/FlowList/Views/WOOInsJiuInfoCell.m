//
//  WOOInsJiuInfoCell.m
//  wooDemo
//
//  Created by colr on 2018/11/13.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsJiuInfoCell.h"

@interface WOOInsJiuInfoCell ()

@property (strong, nonatomic)UILabel * titleLabel;

@property (strong, nonatomic)UILabel * topLabel;

@property (strong, nonatomic)YYAnimatedImageView * coverImageV;

@property (strong, nonatomic)UIView * imageBackView; //图片背景view

@end

@implementation WOOInsJiuInfoCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.contentView.backgroundColor = woo_colorWithHexString(@"D8D8D8");
    [self.contentView addSubview:self.coverImageV];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.topLabel];
    [self.contentView addSubview:self.imageBackView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.coverImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(0);
        make.width.mas_equalTo(88);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(7);
        make.right.mas_equalTo(-130);
    }];
    
    [self.imageBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(65);
    }];
    
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(7);
        make.right.mas_equalTo(-7);
    }];
    
    self.contentView.layer.cornerRadius = 8;
    self.contentView.clipsToBounds = YES;
}

- (void)setModel:(WOOArticleModel *)model {
    if (model) {
        [self.coverImageV yy_setImageWithURL:[NSURL URLWithString:model.middle_image] options:YYWebImageOptionProgressive];
        self.titleLabel.text = model.title;
        self.imageBackView.hidden = model.image_list.count < 1;
        self.coverImageV.hidden = model.image_list.count > 0;
        self.topLabel.hidden = model.image_list.count < 1;
        if (model.image_list.count > 0) {
            self.topLabel.text = model.title;
            [self imageBackViewSetImages:model.image_list];
        }
    }
}

- (void)imageBackViewSetImages:(NSArray*)images {
    CGFloat margin = images.count - 1;
    CGFloat width = (self.contentView.width - margin) / images.count;
    int  i = 0;
    for (NSDictionary * imageDic in images) {
        YYAnimatedImageView * imageV = [[YYAnimatedImageView alloc]init];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        imageV.backgroundColor = woo_colorWithHexString(@"D8D8D8");
        [imageV yy_setImageWithURL:[NSURL URLWithString:imageDic[@"url"]] options:YYWebImageOptionProgressive];
        [imageV setFrame:CGRectMake(i*(width+1), 0, width, 65)];
        [self.imageBackView addSubview:imageV];
        i++;
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.label.WH_font(WOOFont(10)).WH_textColor(woo_colorWithHexString(@"4A4A4A")).WH_numberOfLines(2);
    }
    return _titleLabel;
}

-(UILabel *)topLabel {
    if (!_topLabel) {
        _topLabel = UILabel.label.WH_font(WOOFont(10)).WH_textColor(woo_colorWithHexString(@"4A4A4A"));
    }
    return _topLabel;
}

- (YYAnimatedImageView *)coverImageV {
    if (!_coverImageV) {
        _coverImageV = [[YYAnimatedImageView alloc]init];
        _coverImageV.contentMode = UIViewContentModeScaleAspectFill;
        _coverImageV.backgroundColor = woo_colorWithHexString(@"D8D8D8");
    }
    return _coverImageV;
}

- (UIView *)imageBackView {
    if (!_imageBackView) {
        _imageBackView = [[UIView alloc]init];
    }
    return _imageBackView;
}

@end

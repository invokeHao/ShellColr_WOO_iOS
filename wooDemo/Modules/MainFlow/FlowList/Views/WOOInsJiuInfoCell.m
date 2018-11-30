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

@property (strong, nonatomic)UIImageView * videoIcon; //标示video

@property (strong, nonatomic)UIImageView * iconView; 

@property (strong, nonatomic)UIView * maskView;

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
    self.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.coverImageV];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.imageBackView];
    [self.contentView addSubview:self.iconView];
    [self.coverImageV addSubview:self.videoIcon];
    [self.imageBackView addSubview:self.maskView];
    [self.imageBackView addSubview:self.topLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.coverImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(104, 104));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.coverImageV.mas_right).offset(10);
        make.right.mas_equalTo(-15);
    }];
    
    [self.imageBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.imageBackView);
    }];

    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-7);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(4);
        make.right.mas_equalTo(-4);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    
    [self.videoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.coverImageV);
        make.right.mas_equalTo(-44);
        make.size.mas_equalTo(CGSizeMake(22 , 22));
    }];
    [self configTheLayer];
}

- (void)setModel:(WOOArticleModel *)model {
    if (model) {
        [self.coverImageV yy_setImageWithURL:[NSURL URLWithString:model.middle_image] options:YYWebImageOptionProgressive];
        self.videoIcon.hidden = YES;
        self.coverImageV.hidden = model.image_list.count > 0;
        self.imageBackView.hidden = model.image_list.count < 1;
        self.titleLabel.hidden = !self.imageBackView.hidden;
        self.titleLabel.attributedText = [model.title attributedStringWithLineSpace:2 fontSpace:1.5f];
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        if (model.has_video) {
            [self.iconView setImage:[UIImage imageNamed:@"play_button"]];
        }else {
            [self.iconView setImage:[UIImage imageNamed:@"article"]];
        }

        if (model.image_list.count > 0) {
            self.topLabel.attributedText = [model.title attributedStringWithLineSpace:1 fontSpace:1.5f];
            self.topLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            [self imageBackViewSetImages:model.image_list];
            [self.imageBackView bringSubviewToFront:self.maskView];
            [self.imageBackView bringSubviewToFront:self.topLabel];
        }
    }
}

- (void)imageBackViewSetImages:(NSArray*)images {
    CGFloat margin = 1;
    CGFloat width = (self.contentView.width - 2*margin) / images.count;
    int  i = 0;
    for (NSDictionary * imageDic in images) {
        YYAnimatedImageView * imageV = [[YYAnimatedImageView alloc]init];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        imageV.clipsToBounds = YES;
        imageV.backgroundColor = woo_colorWithHexString(@"D8D8D8");
        [imageV yy_setImageWithURL:[NSURL URLWithString:imageDic[@"url"]] options:YYWebImageOptionProgressive];
        [imageV setFrame:CGRectMake(i*(width+margin), 0, width, self.height)];
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
    [self.coverImageV roundCorner:UIRectCornerTopLeft|UIRectCornerBottomLeft radius:15];
    [self.imageBackView roundCorner:UIRectCornerAllCorners radius:15];
    
    self.layer.cornerRadius = 15;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowColor = woo_colorWithHexAndAlpha(@"000000", 0.1).CGColor;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 2;
    
    NSArray * colorArr = @[woo_colorWithHexAndAlpha(@"000000", 0.0),woo_colorWithHexAndAlpha(@"000000", 0.4)];
    [_maskView setGradientBackgroundWithColors:colorArr locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.label.WH_font(WOOFont(14)).WH_textColor(woo_colorWithHexString(@"8C8C8C")).WH_numberOfLines(2);
    }
    return _titleLabel;
}

-(UILabel *)topLabel {
    if (!_topLabel) {
        _topLabel = UILabel.label.WH_font(WOOFont(14)).WH_numberOfLines(1).WH_textColor([UIColor whiteColor]);
    }
    return _topLabel;
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

- (UIView *)imageBackView {
    if (!_imageBackView) {
        _imageBackView = [[UIView alloc]init];
    }
    return _imageBackView;
}

- (UIImageView *)videoIcon {
    if (!_videoIcon) {
        _videoIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"play_button"]];
        _videoIcon.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _videoIcon;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = UIImageView.imageView;
        _iconView.alpha = 0.8;
    }
    return _iconView;
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc]init];
    }
    return _maskView;
}
@end

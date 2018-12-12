//
//  WOORewardHisCell.m
//  wooDemo
//
//  Created by colr on 2018/12/11.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOORewardHisCell.h"

@interface WOORewardHisCell()

@property (nonatomic, strong)UIView * headerView;

@property (nonatomic, strong)UILabel * dateLabel;

@property (nonatomic, strong)UILabel * shareLabel;

@property (nonatomic, strong)UILabel * statusLabel;

@property (nonatomic, strong)UIView * lineView;

@property (nonatomic, strong)UIView * bottomView;

@property (nonatomic, strong)YYAnimatedImageView * goodsIconV;

@property (nonatomic, strong)UILabel * goodsNameLabel;

@property (nonatomic, strong)UILabel * goodsRewardLabel;

@property (nonatomic, strong)UILabel * goodsPriceLabel;

@property (nonatomic, strong)UILabel * goodsCoinLabel;

@property (nonatomic, strong)UIImageView * moreView;

@end

@implementation WOORewardHisCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubviewArray:@[self.headerView, self.bottomView]];
    [self.headerView addSubviewArray:@[self.dateLabel,self.shareLabel,self.statusLabel,self.lineView]];
    [self.bottomView addSubviewArray:@[self.goodsIconV,self.goodsNameLabel,self.goodsRewardLabel,self.goodsPriceLabel,self.goodsCoinLabel,self.moreView]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(36);
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.centerY.mas_equalTo(self.headerView);
        make.height.mas_equalTo(17);
    }];
    
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-16);
        make.centerY.mas_equalTo(self.dateLabel);
        make.size.mas_equalTo(CGSizeMake(68, 20));
    }];
    
    [self.shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.statusLabel.mas_left).offset(-12);
        make.centerY.mas_equalTo(self.dateLabel);
        make.size.mas_equalTo(CGSizeMake(75, 20));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
     
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.headerView.mas_bottom).offset(0);
        make.height.mas_equalTo(130);
    }];
    
    [self.goodsIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(15);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [self.goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.goodsIconV.mas_top).offset(4);
        make.left.mas_equalTo(self.goodsIconV.mas_right).offset(26);
        make.height.mas_equalTo(17);
    }];
    
    [self.goodsRewardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodsNameLabel);
        make.top.mas_equalTo(self.goodsNameLabel.mas_bottom).offset(8);
        make.height.mas_equalTo(17);
    }];
    
    [self.goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodsNameLabel);
        make.top.mas_equalTo(self.goodsRewardLabel.mas_bottom).offset(8);
        make.height.mas_equalTo(17);
    }];
    
    [self.goodsCoinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodsNameLabel);
        make.top.mas_equalTo(self.goodsPriceLabel.mas_bottom).offset(8);
        make.height.mas_equalTo(17);
    }];
    [self.moreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bottomView);
        make.right.mas_equalTo(-13);
        make.size.mas_equalTo(CGSizeMake(10, 16));
    }];
}

- (void)setModel:(WOORewardRow *)model {
    if (model) {
        _model = model;
        NSString * timeStr = [self getDateStringWithTimeStr:model.createDate];
        self.dateLabel.text = FORMAT(@"购买日期 %@",timeStr);
        NSString * imageStr = model.productImage.url;
        if (!imageStr) {
            imageStr = @"https://img13.360buyimg.com/babel/s320x320_jfs/t25333/286/1148627644/132468/e935cde5/5b8df4e1Nfdcae39e.jpg";
        }
        [self.goodsIconV yy_setImageWithURL:[NSURL URLWithString:imageStr] options:YYWebImageOptionProgressive];
        [self.goodsNameLabel setText:model.productName];
        [self.goodsRewardLabel setText:FORMAT(@"返利：     ¥%ld.00",(long)model.rewardAmount)];
        [self.goodsPriceLabel setText:FORMAT(@"原价：  ¥%ld.00",(long)model.priceAmount)];
        [self.goodsCoinLabel setText:FORMAT(@"花费注意力： ¥%ld.00",(long)model.payCoinAmount)];
        //配置orderStatus
        [self configTheOrderStatus];
    }
}

- (void)configTheOrderStatus {
    NSString * statusStr = nil;
    NSString * backgroundStr = nil;
    switch (self.model.orderStatusType) {
        case WOOOrderStatusTypeCancel:
            statusStr = @"已取消";
            backgroundStr = @"#D5D5D5";
            break;
        case WOOOrderStatusTypePayed:
            statusStr = @"已付款";
            backgroundStr = @"##EB5E6E";
            break;
        case WOOOrderStatusTypeSended:
            statusStr = @"已发货";
            backgroundStr = @"#F5A623";
            break;
        case WOOOrderStatusTypeCompleted:
            statusStr = @"已收获";
            backgroundStr = @"#B3E220";
            break;
        case WOOOrderStatusTypeDefault:
            statusStr = @"未支付";
            backgroundStr = @"#EB5E6E";
            break;
        default:
            break;
    }
    self.statusLabel.text = statusStr;
    self.statusLabel.backgroundColor = woo_colorWithHexString(backgroundStr);
    self.shareLabel.hidden = self.model.orderStatus != WOOOrderStatusTypeCompleted;
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc]init];
    }
    return _headerView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
    }
    return _bottomView;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = UILabel.label.WH_font(WOOMFont(12)).WH_textColor(woo_colorWithHexString(@"#444444")).WH_text(@"购买时间");
    }
    return _dateLabel;
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = UILabel.label.WH_font([UIFont boldSystemFontOfSize:12]).WH_textColor([UIColor whiteColor]).WH_textAlignment(NSTextAlignmentCenter).WH_text(@"待确认");
        _statusLabel.backgroundColor = woo_colorWithHexString(@"#F5A623");
        _statusLabel.layer.cornerRadius = 10;
        _statusLabel.layer.masksToBounds = YES;
    }
    return _statusLabel;
}

- (UILabel *)shareLabel {
    if (!_shareLabel) {
        _shareLabel = UILabel.label.WH_font(WOOMFont(12)).WH_textColor(woo_colorWithHexString(@"#B3E220")).WH_textAlignment(NSTextAlignmentCenter).WH_text(@"炫耀一下");
        _shareLabel.layer.cornerRadius = 10;
        _shareLabel.layer.masksToBounds = YES;
        _shareLabel.layer.borderColor = woo_colorWithHexString(@"#B3E220").CGColor;
        _shareLabel.layer.borderWidth = 1;
    }
    return _shareLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = woo_colorWithHexString(@"#F0F0F0");
    }
    return _lineView;
}

- (YYAnimatedImageView *)goodsIconV {
    if (!_goodsIconV) {
        _goodsIconV = [[YYAnimatedImageView alloc]init];
        _goodsIconV.layer.cornerRadius = 12;
        _goodsIconV.contentMode = UIViewContentModeScaleAspectFit;
        _goodsIconV.clipsToBounds = YES;
    }
    return _goodsIconV;
}

- (UILabel *)goodsNameLabel {
    if (!_goodsNameLabel) {
        _goodsNameLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"#444444"));
    }
    return _goodsNameLabel;
}

- (UILabel *)goodsRewardLabel {
    if (!_goodsRewardLabel) {
        _goodsRewardLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"#444444"));
    }
    return _goodsRewardLabel;
}

- (UILabel *)goodsPriceLabel {
    if (!_goodsPriceLabel) {
        _goodsPriceLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"#444444"));
    }
    return _goodsPriceLabel;
}

- (UILabel *)goodsCoinLabel {
    if (!_goodsCoinLabel) {
        _goodsCoinLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"#444444"));
    }
    return _goodsCoinLabel;
}

- (UIImageView *)moreView {
    if (!_moreView) {
        _moreView = UIImageView.imageView.WH_image(WOOImageNamed(@"more"));
    }
    return _moreView;
}

-(void)setFrame:(CGRect)frame {
    frame.origin.y += 8;
    frame.size.height -= 8;
    [super setFrame:frame];
}

// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
- (NSString *)getDateStringWithTimeStr:(NSInteger)createTime{
    NSTimeInterval time= createTime / 1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    return currentDateStr;
}

@end

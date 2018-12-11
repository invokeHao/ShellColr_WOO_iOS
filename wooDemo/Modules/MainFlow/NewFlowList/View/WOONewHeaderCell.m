//
//  WOONewHeaderCell.m
//  wooDemo
//
//  Created by colr on 2018/12/6.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOONewHeaderCell.h"

@interface WOONewHeaderCell ()

@property (nonatomic, strong)UIView * shadowView;

@end

@implementation WOONewHeaderCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.findLabel];
    [self.contentView addSubview:self.shadowView];
    [self.contentView addSubview:self.dateLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.findLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(15 + STATUS_BAR_HEIGHT - 20);
        make.height.mas_equalTo(17);
    }];
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(108, 22));
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(110, 24));
    }];
    _dateLabel.layer.cornerRadius = 12;
    _dateLabel.layer.masksToBounds = YES;
    
    _shadowView.layer.cornerRadius = 12;
    _shadowView.layer.shadowColor = woo_colorWithHexAndAlpha(@"000000", 0.25).CGColor;
    _shadowView.layer.shadowOpacity = 0.8;
    _shadowView.layer.shadowOffset = CGSizeMake(0, 0);
    _shadowView.layer.shadowRadius = 5;
}

- (void)showTheDate {
    _shadowView.hidden = _dateLabel.hidden = NO;
    _dateLabel.attributedText = [[self getTheCurrentDate] attributedStringWithLineSpace:2 fontSpace:1.5f];
    _dateLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)hidenTheDate {
    _shadowView.hidden = _dateLabel.hidden = YES;
}

- (UILabel *)findLabel {
    if(!_findLabel){
        _findLabel = UILabel.label.WH_font(WOOMFont(16)).WH_textColor(woo_colorWithHexString(@"#171F24"));
        _findLabel.attributedText = [@"发现" attributedStringWithLineSpace:0.0f fontSpace:3.0f];
    }
    return _findLabel;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = UILabel.label.WH_textColor(woo_colorWithHexString(@"#EEEEEE")).WH_font(WOOFont(9));
        _dateLabel.backgroundColor = woo_colorWithHexString(@"#333333");
        _dateLabel.hidden = YES;
    }
    return _dateLabel;
}

- (UIView *)shadowView {
    if (!_shadowView) {
        _shadowView = [[UIView alloc]init];
        _shadowView.backgroundColor = [UIColor redColor];
    }
    return _shadowView;
}

- (NSString *)getTheCurrentDate {
    NSDate  *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    NSInteger month=[components month];
    NSInteger day=[components day];
    return FORMAT(@"今天，%ld月%ld日",month, day);
}

@end

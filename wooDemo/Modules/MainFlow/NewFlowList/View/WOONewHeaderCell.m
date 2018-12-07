//
//  WOONewHeaderCell.m
//  wooDemo
//
//  Created by colr on 2018/12/6.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOONewHeaderCell.h"

@interface WOONewHeaderCell ()

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
    [self.contentView addSubview:self.dateLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.findLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(15);
        make.height.mas_equalTo(17);
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(110, 24));
    }];
    _dateLabel.layer.cornerRadius = 12;
    _dateLabel.layer.masksToBounds = YES;
}

- (void)showTheDate {
    _dateLabel.hidden = NO;
    _dateLabel.attributedText = [[self getTheCurrentDate] attributedStringWithLineSpace:2 fontSpace:1.5f];
    _dateLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)hidenTheDate {
    _dateLabel.hidden = YES;
}

- (UILabel *)findLabel {
    if(!_findLabel){
        _findLabel = UILabel.label.WH_font(WOOFont(16)).WH_text(@"发现").WH_textColor(woo_colorWithHexString(@"#171F24"));
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

- (NSString *)getTheCurrentDate {
    NSDate  *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    
    NSInteger month=[components month];
    NSInteger day=[components day];
    return FORMAT(@"今天，%ld月%ld日",month, day);
}

@end

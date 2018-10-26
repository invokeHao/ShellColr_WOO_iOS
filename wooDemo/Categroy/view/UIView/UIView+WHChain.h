//
//  UIView+WHChain.h
//  block
//
//  Created by wang on 2017/7/21.
//  Copyright © 2017年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

@interface UIView (WHChain)

- (UIView *(^)(CGRect))WH_frame;
- (UIView *(^)(CGPoint))WH_center;
- (UIView *(^)(NSString *))WH_backgroundColor;
- (UIView *(^)(UIView*))WH_addSubview;
- (UIView *(^)(CGFloat))WH_alpha;
- (UIView *(^)(BOOL))WH_clipsToBounds;
- (UIView *(^)(BOOL))WH_hidden;
- (UIView *(^)(BOOL))WH_userInteractionEnabled;

@end

@interface UILabel (WHChain)

+ (UILabel *)label;
- (UILabel *(^)(NSString *))WH_text;
- (UILabel *(^)(UIFont *))WH_font;
- (UILabel *(^)(UIColor *))WH_textColor;
- (UILabel *(^)(UIColor *))WH_shadowColor;
- (UILabel *(^)(CGSize))WH_shadowOffset;
- (UILabel *(^)(NSTextAlignment))WH_textAlignment;
- (UILabel *(^)(NSLineBreakMode))WH_lineBreakMode;
- (UILabel *(^)(BOOL))WH_enabled;
- (UILabel *(^)(NSInteger))WH_numberOfLines;
- (UILabel *(^)(void))WH_sizeToFit;
- (UILabel *(^)(BOOL))WH_adjustsFontSizeToFitWidth;
- (UILabel *(^)(BOOL))WH_adjustsLetterSpacingToFitWidth;
/****************************子类重写父类方法*********************************/
- (UILabel *(^)(CGRect))WH_frame;
- (UILabel *(^)(CGPoint))WH_center;
- (UILabel *(^)(NSString *))WH_backgroundColor;
- (UILabel *(^)(UIView*))WH_addSubview;
- (UILabel *(^)(CGFloat))WH_alpha;
- (UILabel *(^)(BOOL))WH_clipsToBounds;
- (UILabel *(^)(BOOL))WH_hidden;
- (UILabel *(^)(BOOL))WH_userInteractionEnabled;

@end

@interface UIButton (WHChain)

+ (UIButton *)button;
- (UIButton *(^)(BOOL))WH_adjustsImageWhenHighlighted;
- (UIButton *(^)(BOOL))WH_adjustsImageWhenDisabled;
- (UIButton *(^)(BOOL))WH_showsTouchWhenHighlighted;
- (UIButton *(^)(UIColor *))WH_tintColor;
- (UIButton *(^)(NSString *,UIControlState))WH_setTitle_forState;
- (UIButton *(^)(UIColor *,UIControlState))WH_setTitleColor_forState;
- (UIButton *(^)(UIColor *,UIControlState))WH_setTitleShadowColor_forState;
- (UIButton *(^)(UIImage *,UIControlState))WH_setImage_forState;
- (UIButton *(^)(UIImage *,UIControlState))WH_setBackgroundImage_forState;
- (UIButton *(^)(UIFont *))WH_titleLabel_font;
/****************************子类重写父类方法*********************************/
- (UIButton *(^)(CGRect))WH_frame;
- (UIButton *(^)(CGPoint))WH_center;
- (UIButton *(^)(NSString *))WH_backgroundColor;
- (UIButton *(^)(UIView*))WH_addSubview;
- (UIButton *(^)(CGFloat))WH_alpha;
- (UIButton *(^)(BOOL))WH_clipsToBounds;
- (UIButton *(^)(BOOL))WH_hidden;
- (UIButton *(^)(BOOL))WH_userInteractionEnabled;

@end

@interface UIImageView (WHChain)

+ (UIImageView *)imageView;
- (UIImageView *(^)(UIImage *))WH_image;
- (UIImageView *(^)(UIImage *))WH_highlightedImage;
- (UIImageView *(^)(BOOL))WH_highlighted;
- (UIImageView *(^)(UIColor *))WH_tintColor;
/****************************子类重写父类方法*********************************/
- (UIImageView *(^)(CGRect))WH_frame;
- (UIImageView *(^)(CGPoint))WH_center;
- (UIImageView *(^)(NSString *))WH_backgroundColor;
- (UIImageView *(^)(UIView*))WH_addSubview;
- (UIImageView *(^)(CGFloat))WH_alpha;
- (UIImageView *(^)(BOOL))WH_clipsToBounds;
- (UIImageView *(^)(BOOL))WH_hidden;
- (UIImageView *(^)(BOOL))WH_userInteractionEnabled;

@end

@interface UITextField (WHChain)

+ (UITextField *)textField;
- (UITextField *(^)(NSString *))WH_text;
- (UITextField *(^)(UIColor *))WH_textColor;
- (UITextField *(^)(UIFont *))WH_font;
- (UITextField *(^)(NSTextAlignment))WH_textAlignment;
- (UITextField *(^)(UITextBorderStyle))WH_borderStyle;
- (UITextField *(^)(NSString *))WH_placeholder;
- (UITextField *(^)(BOOL))WH_clearsOnBeginEditing;
- (UITextField *(^)(BOOL))WH_adjustsFontSizeToFitWidth;
- (UITextField *(^)(CGFloat))WH_minimumFontSize;
- (UITextField *(^)(NSObject *))WH_delegate;
- (UITextField *(^)(UIImage *))WH_background;
- (UITextField *(^)(UIImage *))WH_disabledBackground;
- (UITextField *(^)(BOOL))WH_allowsEditingTextAttributes;
- (UITextField *(^)(UITextFieldViewMode))WH_clearButtonMode;
- (UITextField *(^)(UIView *))WH_leftView;
- (UITextField *(^)(UITextFieldViewMode))WH_leftViewMode;
- (UITextField *(^)(UIView *))WH_rightView;
- (UITextField *(^)(UITextFieldViewMode))WH_rightViewMode;
/**************************子类重写父类方法*******************************/
- (UITextField *(^)(CGRect))WH_frame;
- (UITextField *(^)(CGPoint))WH_center;
- (UITextField *(^)(NSString *))WH_backgroundColor;
- (UITextField *(^)(UIView*))WH_addSubview;
- (UITextField *(^)(CGFloat))WH_alpha;
- (UITextField *(^)(BOOL))WH_clipsToBounds;
- (UITextField *(^)(BOOL))WH_hidden;
- (UITextField *(^)(BOOL))WH_userInteractionEnabled;


@end

@interface UITextView (WHChain)

+ (UITextView *)textView;
- (UITextView *(^)(NSObject *))WH_delegate;
- (UITextView *(^)(NSString *))WH_text;
- (UITextView *(^)(UIFont *))WH_font;
- (UITextView *(^)(UIColor *))WH_textColor;
- (UITextView *(^)(NSTextAlignment))WH_textAlignment;
- (UITextView *(^)(NSRange))WH_selectedRange;
- (UITextView *(^)(BOOL))WH_allowsEditingTextAttributes;
/**************************子类重写父类方法*******************************/
- (UITextView *(^)(CGRect))WH_frame;
- (UITextView *(^)(CGPoint))WH_center;
- (UITextView *(^)(NSString *))WH_backgroundColor;
- (UITextView *(^)(UIView*))WH_addSubview;
- (UITextView *(^)(CGFloat))WH_alpha;
- (UITextView *(^)(BOOL))WH_clipsToBounds;
- (UITextView *(^)(BOOL))WH_hidden;
- (UITextView *(^)(BOOL))WH_userInteractionEnabled;

@end

@interface UITableView (WHChain)

+ (UITableView *(^)(UITableViewStyle))tableView;
- (UITableView *(^)(NSObject *))WH_dataSource;
- (UITableView *(^)(NSObject *))WH_delegate;
- (UITableView *(^)(CGFloat))WH_rowHeight;
- (UITableView *(^)(CGFloat))WH_sectionHeaderHeight;
- (UITableView *(^)(CGFloat))WH_sectionFooterHeight;
- (UITableView *(^)(CGFloat))WH_estimatedRowHeight;
- (UITableView *(^)(CGFloat))WH_estimatedSectionHeaderHeight;
- (UITableView *(^)(CGFloat))WH_estimatedSectionFooterHeight;
- (UITableView *(^)(UIEdgeInsets))WH_separatorInset;
- (UITableView *(^)(UIView *))WH_backgroundView;
- (UITableView *(^)(UITableViewCellSeparatorStyle))WH_separatorStyle;
- (UITableView *(^)(UIView *))WH_tableHeaderView;
- (UITableView *(^)(UIView *))WH_tableFooterView;
/**************************子类重写父类方法*******************************/
- (UITableView *(^)(CGRect))WH_frame;
- (UITableView *(^)(CGPoint))WH_center;
- (UITableView *(^)(NSString *))WH_backgroundColor;
- (UITableView *(^)(UIView*))WH_addSubview;
- (UITableView *(^)(CGFloat))WH_alpha;
- (UITableView *(^)(BOOL))WH_clipsToBounds;
- (UITableView *(^)(BOOL))WH_hidden;
- (UITableView *(^)(BOOL))WH_userInteractionEnabled;

@end

@interface UICollectionView (WHChain)

+ (UICollectionView *(^)(UICollectionViewLayout *))collectionView;
- (UICollectionView *(^)(UICollectionViewLayout *))WH_collectionViewLayout;
- (UICollectionView *(^)(NSObject *))WH_delegate;
- (UICollectionView *(^)(NSObject *))WH_dataSource;
- (UICollectionView *(^)(UIView *))WH_backgroundView;
- (UICollectionView *(^)(Class ,NSString *))WH_registerClass_forCellWithReuseIdentifier;
- (UICollectionView *(^)(UINib *,NSString *))WH_registerNib_forCellWithReuseIdentifier;
- (UICollectionView *(^)(Class ,NSString *,NSString *))WH_registerClass_forSupplementaryViewOfKind_withReuseIdentifier;
- (UICollectionView *(^)(UINib *,NSString *,NSString *))WH_registerNib_forSupplementaryViewOfKind_withReuseIdentifier;
/**************************子类重写父类方法*******************************/
- (UICollectionView *(^)(CGRect))WH_frame;
- (UICollectionView *(^)(CGPoint))WH_center;
- (UICollectionView *(^)(NSString *))WH_backgroundColor;
- (UICollectionView *(^)(UIView*))WH_addSubview;
- (UICollectionView *(^)(CGFloat))WH_alpha;
- (UICollectionView *(^)(BOOL))WH_clipsToBounds;
- (UICollectionView *(^)(BOOL))WH_hidden;
- (UICollectionView *(^)(BOOL))WH_userInteractionEnabled;

@end

@interface UICollectionViewFlowLayout (WHChain)

+ (UICollectionViewFlowLayout *)CollectionViewFlowLayout;
- (UICollectionViewFlowLayout *(^)(CGFloat))WH_minimumLineSpacing;
- (UICollectionViewFlowLayout *(^)(CGFloat))WH_minimumInteritemSpacing;
- (UICollectionViewFlowLayout *(^)(CGSize))WH_itemSize;
- (UICollectionViewFlowLayout *(^)(CGSize))WH_estimatedItemSize;
- (UICollectionViewFlowLayout *(^)(UICollectionViewScrollDirection))WH_scrollDirection;
- (UICollectionViewFlowLayout *(^)(CGSize))WH_headerReferenceSize;
- (UICollectionViewFlowLayout *(^)(CGSize))WH_footerReferenceSize;
- (UICollectionViewFlowLayout *(^)(UIEdgeInsets))WH_sectionInset;


@end

@interface UIScrollView (WHChain)

+ (UIScrollView *)scrollView;
- (UIScrollView *(^)(CGPoint))WH_contentOffset;
- (UIScrollView *(^)(CGSize))WH_contentSize;
- (UIScrollView *(^)(UIEdgeInsets))WH_contentInset;
- (UIScrollView *(^)(BOOL))WH_bounces;
- (UIScrollView *(^)(BOOL))WH_pagingEnabled;
- (UIScrollView *(^)(BOOL))WH_scrollEnabled;
- (UIScrollView *(^)(BOOL))WH_showsHorizontalScrollIndicator;
- (UIScrollView *(^)(BOOL))WH_showsVerticalScrollIndicator;
- (UIScrollView *(^)(UIEdgeInsets))WH_scrollIndicatorInsets;
- (UIScrollView *(^)(CGFloat))WH_minimumZoomScale;
- (UIScrollView *(^)(CGFloat))WH_maximumZoomScale;
/**************************子类重写父类方法*******************************/
- (UIScrollView *(^)(CGRect))WH_frame;
- (UIScrollView *(^)(CGPoint))WH_center;
- (UIScrollView *(^)(NSString *))WH_backgroundColor;
- (UIScrollView *(^)(UIView*))WH_addSubview;
- (UIScrollView *(^)(CGFloat))WH_alpha;
- (UIScrollView *(^)(BOOL))WH_clipsToBounds;
- (UIScrollView *(^)(BOOL))WH_hidden;
- (UIScrollView *(^)(BOOL))WH_userInteractionEnabled;

@end



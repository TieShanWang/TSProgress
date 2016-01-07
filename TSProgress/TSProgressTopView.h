//
//  TSProgressTopView.h
//  WTSProgress
//
//  Created by MR.KING on 16/1/3.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TSKscreenSize [UIScreen mainScreen].bounds.size
#define TSKscreenWidth TSKscreenSize.width
#define TSKscreenHeitht TSKscreenSize.height

#define ShadowWidth 10 // 阴影宽
#define ProgressWidth 130 // 提示框的宽度
#define ProgressRowHeight 20

#define FontSize 13

#define CenterFrame CGRectMake((TSKscreenWidth - ProgressWidth)/2, (TSKscreenHeitht - 3 * ProgressRowHeight)/2, ProgressWidth, 3 * ProgressRowHeight) 

typedef enum : NSUInteger {
    TSProgressIndicatorstyle, // 活动指示器
    TSProgressImageStyle, // 自定义图片
    TSProgressNoneStyle // 没有类型特效
} TSProgressStyle;

typedef enum : NSUInteger {
    TSPositionUpStyle,
    TSPositionBottomStyle,
    TSPositionLeftStyle,
    TSPositionRightStyle,
    TSPositionCenterStyle
} TSPositionStyle;

struct TSFrame {
    CGRect left;
    CGRect right;
    CGRect bottom;
    CGRect up;
    CGRect center;
};

@interface TSProgressTopView : UIView
{
    @protected
    UILabel * _titleLable;
    UILabel * _statusLable;
    UIView * _centerView;
}
// style
@property(nonatomic,assign) TSProgressStyle style;

// titleLable
@property(nonatomic,strong,nonnull) UILabel * titleLable;

// title
@property(nonatomic,copy,nonnull) NSString * title;

// images  动画的图片
@property(nonatomic,strong,nullable) NSMutableArray <UIImage*>* arrayImages;

// centerView
@property(nonatomic,strong,nonnull)UIView * centerView;

// statusLable
@property(nonatomic,strong,nonnull) UILabel * statusLable;

// statusTitle
@property(nonatomic,copy,nullable) NSString * statusTitle;


// 阴影颜色
@property(nonatomic,strong,nullable) UIColor * shadowColor;

-(void)setProgressWithStyle:(TSProgressStyle)style title:(nonnull NSString*)title  arrayImage:(nullable NSArray *)arrayImageS statusTitle:(nullable NSString*)statusTitle;




@end

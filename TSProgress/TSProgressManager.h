//
//  TSProgressManager.h
//  WTSProgress
//
//  Created by MR.KING on 16/1/3.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSProgressTopView.h"

typedef void(^Completion)();

@interface TSProgressManager : NSObject

// title
@property(nonatomic,copy,nonnull) NSString * title;

// statusTitle
@property(nonatomic,copy,nullable) NSString * statusTitle;

// images  动画的图片
@property(nonatomic,strong,nullable) NSMutableArray <UIImage*>* arrayImages;

@property(nonatomic,copy,nullable) Completion completion;

+(void)dismiss;
//  指示器类型显示 回调
+(void)dismissIndictorProgressWith:(nonnull NSString*)title completion:(nonnull Completion)completion;
//  指示器类型显示 回调
+(void)dismissIndictorProgressWith:(nonnull NSString*)title statusTitle:(nullable NSString*)statusTitle;
//  指示器类型显示
+(void)dismissIndictorProgressWith:(nonnull NSString*)title;
//  指示器类型显示 回调
+(void)dismissIndictorProgressWith:(nonnull NSString*)title statusTitle:(nullable NSString*)statusTitle afterDelay:(CGFloat)delay completion:(nonnull Completion)completion;
// 指示器类型的消失
+(void)dismissIndictorProgressWith:(nonnull NSString*)title statusTitle:(nullable NSString*)statusTitle afterDelay:(CGFloat)delay;
//  指示器类型显示 回调
+(void)showIndictorProgressWith:(nonnull NSString*)title completion:(nonnull Completion)completion;
//  指示器类型显示
+(void)showIndictorProgressWith:(nonnull NSString*)title;
//  指示器类型显示 回调
+(void)showIndictorProgressWith:(nonnull NSString*)title statusTitle:(nullable NSString*)statusTitle afterDelay:(CGFloat)delay completion:(nonnull Completion)completion;
// 指示器类型的 显示
+(void)showIndictorProgressWith:(nonnull NSString*)title statusTitle:(nullable NSString*)statusTitle duration:(CGFloat)duration;
+(void)showProgressWith:(nonnull NSString*)title statusTitle:(nullable NSString*)statusTitle arrImage:(nullable NSArray*)arrImages style:(TSProgressStyle) progressStyle position:(TSPositionStyle)positionStyle duration:(CGFloat)duration completion:(nullable Completion)completion;

@end

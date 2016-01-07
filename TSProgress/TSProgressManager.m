//
//  TSProgressManager.m
//  WTSProgress
//
//  Created by MR.KING on 16/1/3.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import "TSProgressManager.h"
#import "TSProgressWindow.h"

@interface TSProgressManager()

/**
 *  是否是正在显示动画
 */
@property(nonatomic,assign) BOOL isShowing;

/**
 *  掌管的window
 */
@property(nonatomic,strong) TSProgressWindow * window;

@end



@implementation TSProgressManager

+(void)dismiss{
    [[TSProgressManager shareManager] hiddenWindow];
}

//  指示器类型显示 回调
+(void)dismissIndictorProgressWith:(NSString*)title completion:(Completion)completion{
    [self showProgressWith:title statusTitle:nil arrImage:nil style:TSProgressIndicatorstyle position:TSPositionCenterStyle duration:0.5 completion:completion];
}

//  指示器类型显示 回调
+(void)dismissIndictorProgressWith:(NSString*)title statusTitle:(NSString*)statusTitle{
    [self showProgressWith:title statusTitle:statusTitle arrImage:nil style:TSProgressIndicatorstyle position:TSPositionCenterStyle duration:0.5 completion:nil];
}

//  指示器类型显示
+(void)dismissIndictorProgressWith:(NSString*)title {
    [self showProgressWith:title statusTitle:nil arrImage:nil style:TSProgressIndicatorstyle position:TSPositionCenterStyle duration:0.5 completion:nil];
}
//  指示器类型显示 回调
+(void)dismissIndictorProgressWith:(NSString*)title statusTitle:(NSString*)statusTitle afterDelay:(CGFloat)delay completion:(Completion)completion{
    [self showProgressWith:title statusTitle:statusTitle arrImage:nil style:TSProgressIndicatorstyle position:TSPositionCenterStyle duration:delay completion:completion];
}

// 指示器类型的消失
+(void)dismissIndictorProgressWith:(NSString*)title statusTitle:(NSString*)statusTitle afterDelay:(CGFloat)delay{
    [self showProgressWith:title statusTitle:statusTitle arrImage:nil style:TSProgressIndicatorstyle position:TSPositionCenterStyle duration:delay completion:nil];
}

//  指示器类型显示 回调
+(void)showIndictorProgressWith:(NSString*)title completion:(Completion)completion{
    [self showProgressWith:title statusTitle:nil arrImage:nil style:TSProgressIndicatorstyle position:TSPositionCenterStyle duration:-1 completion:completion];
}


//  指示器类型显示
+(void)showIndictorProgressWith:(NSString*)title {
    [self showProgressWith:title statusTitle:nil arrImage:nil style:TSProgressIndicatorstyle position:TSPositionCenterStyle duration:-1 completion:nil];
}
//  指示器类型显示 回调
+(void)showIndictorProgressWith:(NSString*)title statusTitle:(NSString*)statusTitle afterDelay:(CGFloat)delay completion:(Completion)completion{
    [self showProgressWith:title statusTitle:statusTitle arrImage:nil style:TSProgressIndicatorstyle position:TSPositionCenterStyle duration:delay completion:completion];
}


// 指示器类型的 显示
+(void)showIndictorProgressWith:(NSString*)title statusTitle:(NSString*)statusTitle duration:(CGFloat)duration{
    [self showProgressWith:title statusTitle:statusTitle arrImage:nil style:TSProgressIndicatorstyle position:TSPositionCenterStyle duration:duration completion:nil];
}


//
+(void)showProgressWith:(NSString*)title statusTitle:(NSString*)statusTitle arrImage:(NSArray*)arrImages style:(TSProgressStyle) progressStyle position:(TSPositionStyle)positionStyle duration:(CGFloat)duration completion:(Completion)completion{
    
    if (completion) {
        [TSProgressManager shareManager].completion = completion;
    }
    
    [[TSProgressManager shareManager].window setProgressWithStyle:progressStyle position:positionStyle title:title arrayImage:arrImages statusTitle:statusTitle];
    
    [[TSProgressManager shareManager] showWindow];
    
    if (duration > 0) {
        [[TSProgressManager shareManager] performSelector:@selector(hiddenWindow) withObject:nil afterDelay:duration];
    }else if (duration == 0){
        [[TSProgressManager shareManager] hiddenWindow];
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initWindow];
    }
    return self;
}

-(void)initWindow{
    self.window = [[TSProgressWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.windowLevel = UIWindowLevelNormal;
}

-(BOOL)isShowing{
    if (self.window.isHidden) {
        return NO;
    }
    return YES;
}

-(void)showWindow{
    if (self.window) {
        [self.window makeKeyWindow];
        self.window.hidden = NO;
    }
}

-(void)hiddenWindow{
    if (self.window) {
        self.window.hidden = YES;
        [self.window resignKeyWindow];
        if ([self.window isFirstResponder]) {
            [self.window resignFirstResponder];
        }
        self.completion();
        self.completion = nil;
    }
}

+(instancetype)shareManager{
    static TSProgressManager * manager ;
    if (manager== nil) {
        manager = [[TSProgressManager alloc]init];
    }
    return manager;
}
















@end

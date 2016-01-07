//
//  TSProgressWindow.h
//  WTSProgress
//
//  Created by MR.KING on 16/1/3.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSProgressTopView.h"

@interface TSProgressWindow : UIWindow
{
    TSProgressTopView * _topView;
}

@property(nonatomic,strong,nonnull) TSProgressTopView * topView;


-(void)setProgressWithStyle:(TSProgressStyle)style position:(TSPositionStyle)positionStyle title:(nonnull NSString*)title  arrayImage:(nullable NSArray *)arrayImageS statusTitle:(nullable NSString*)statusTitle;

@end

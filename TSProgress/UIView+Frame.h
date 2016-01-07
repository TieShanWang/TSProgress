//
//  UIView+Frame.h
//  Frame
//
//  Created by MR.KING on 15/12/15.
//  Copyright © 2015年 MR.KING. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

- (instancetype)initWithAutoFrame:(CGRect)frame;
-(void)setAutoFrame:(CGRect)frame;
-(CGRect)transFrameWithFrame:(CGRect)Frame;
-(CGRect)transFrameWidthChange:(BOOL)isWidthChange
                  heightChange:(BOOL)isHeightChange
                    leftChange:(BOOL)isLeftChange
                     topChange:(BOOL)isTopChange
                     withFrmae:(CGRect)frame;
-(CGRect)transLeftWith:(CGRect)frame;
-(CGRect)transTopWith:(CGRect)frame;
-(CGRect)transWidthWith:(CGRect)frame;
-(CGRect)transHeightWith:(CGRect)frame;
-(CGRect)transLeftAndWidthWith:(CGRect)frame;
-(CGRect)transTopAndHeightWith:(CGRect)frame;
-(CGRect)transLeftAndTopWith:(CGRect)frame;
-(CGRect)transWidthAndHeightWith:(CGRect)frame;
-(CGRect)transNOChangeLeftAndRigth:(CGRect)frame;

-(CGFloat)width;
-(CGFloat)height;
-(CGFloat)left;
-(CGFloat)right;
-(CGFloat)up;
-(CGFloat)bottom;
@end

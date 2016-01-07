//
//  UIView+Frame.m
//  Frame
//
//  Created by MR.KING on 15/12/15.
//  Copyright © 2015年 MR.KING. All rights reserved.
//

#import "UIView+Frame.h"



#define KScreenInSize [UIScreen mainScreen].bounds.size
#define KScreenInWidth KScreenInSize.width
#define KScreenInHeight KScreenInSize.height


#define KScreenINIphone_6_width 375
#define KScreenInIphone_6_height 667

#define RateWidth  ((CGFloat)KScreenInWidth/KScreenINIphone_6_width)
#define RateHeight  ((CGFloat)KScreenInHeight/KScreenInIphone_6_height)

@implementation UIView (Frame)

- (instancetype)initWithAutoFrame:(CGRect)frame
{
    [[self initWithFrame:frame] setAutoFrame:self.frame];
    return self;
}

-(void)setAutoFrame:(CGRect)frame{
    self.frame = [self transFrameWithFrame:frame];
}

-(CGRect)transFrameWithFrame:(CGRect)Frame{
    
    return [self transFrameWidthChange:YES heightChange:YES leftChange:YES topChange:YES withFrmae:Frame];
}


-(CGRect)transFrameWidthChange:(BOOL)isWidthChange
                  heightChange:(BOOL)isHeightChange
                    leftChange:(BOOL)isLeftChange
                     topChange:(BOOL)isTopChange
                     withFrmae:(CGRect)frame{
    CGRect tmpFrame = frame;
    if (isLeftChange) {
        tmpFrame = [self transLeftWith:tmpFrame];
    }
    if (isTopChange) {
        tmpFrame = [self transTopWith:tmpFrame];
    }
    if (isWidthChange) {
        tmpFrame = [self transWidthWith:tmpFrame];
    }
    if (isHeightChange) {
        tmpFrame = [self transHeightWith:tmpFrame];
    }
    return tmpFrame;
}

-(CGRect)transLeftWith:(CGRect)frame{
    frame.origin.x *= RateWidth;
    return frame;
}

-(CGRect)transTopWith:(CGRect)frame{
    frame.origin.y *= RateHeight;
    return frame;
}

-(CGRect)transWidthWith:(CGRect)frame{
    frame.size.width *= RateWidth;
    return frame;
}

-(CGRect)transHeightWith:(CGRect)frame{
    frame.size.height *= RateHeight;
    return frame;
}

-(CGRect)transLeftAndWidthWith:(CGRect)frame{
    return  [self transFrameWidthChange:YES heightChange:NO leftChange:YES topChange:NO withFrmae:frame];
}

-(CGRect)transTopAndHeightWith:(CGRect)frame{
    return [self transFrameWidthChange:NO heightChange:YES leftChange:NO topChange:YES withFrmae:frame];
}

-(CGRect)transLeftAndTopWith:(CGRect)frame{
    return [self transFrameWidthChange:NO heightChange:NO leftChange:YES topChange:YES withFrmae:frame];
}

-(CGRect)transWidthAndHeightWith:(CGRect)frame{
    return [self transFrameWidthChange:YES heightChange:YES leftChange:NO topChange:NO withFrmae:frame];
}

-(CGRect)transNOChangeLeftAndRigth:(CGRect)frame{
    frame.size.width = KScreenInWidth - frame.origin.x - (KScreenINIphone_6_width - frame.origin.x - frame.size.width);
    return frame;
}
-(CGRect)transNOChangeTopAndBottom:(CGRect)frame{
    frame.size.height = KScreenInHeight - [self up] - (KScreenInIphone_6_height - [self bottom]);
    return frame;
}

-(CGFloat)width{
    return  self.frame.size.width;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(CGFloat)left{
    return self.frame.origin.x;
}

-(CGFloat)right{
    return [self left] + [self width];
}

-(CGFloat)up{
    return self.frame.origin.y;
}

-(CGFloat)bottom{
    return [self up] + [self height];
}

@end

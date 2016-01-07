//
//  TSProgressWindow.m
//  WTSProgress
//
//  Created by MR.KING on 16/1/3.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import "TSProgressWindow.h"

@implementation TSProgressWindow


-(void)setProgressWithStyle:(TSProgressStyle)style position:(TSPositionStyle)positionStyle title:(NSString *)title arrayImage:(NSArray *)arrayImageS statusTitle:(NSString *)statusTitle{
    if (positionStyle == TSPositionCenterStyle) {
        CGRect frame = CenterFrame;
        NSInteger row = 1;
        if (TSProgressNoneStyle != style) {
            row++;
        }
        if ([statusTitle length] > 0) {
            row++;
        }
        frame.size.height = row * ProgressRowHeight;
        self.topView.frame = frame;
    }
    [self.topView setProgressWithStyle:style title:title arrayImage:arrayImageS statusTitle:statusTitle];
    [self.topView setNeedsDisplay];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.topView = [[TSProgressTopView alloc]initWithFrame:CenterFrame];
        [self addSubview:self.topView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
}


@end

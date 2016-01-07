//
//  TSProgressTopView.m
//  WTSProgress
//
//  Created by MR.KING on 16/1/3.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import "TSProgressTopView.h"
#import "UIView+Frame.h"

@implementation TSProgressTopView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLable];
        [self addSubview:self.centerView];
        [self addSubview:self.statusLable];
    }
    return self;
}

-(void)setProgressWithStyle:(TSProgressStyle)style title:(NSString*)title  arrayImage:(NSArray *)arrayImageS statusTitle:(NSString*)statusTitle{
    if (style) {
        self.style = style;
    }
    if (arrayImageS.count > 0) {
        self.arrayImages = [[NSMutableArray alloc]initWithArray:arrayImageS];
    }
    if (title) {
        self.title = title;
    }
    if (statusTitle) {
        self.statusTitle = statusTitle;
    }
    [self refreshData];
}

-(void)refreshData{
    [_centerView removeFromSuperview];
    _centerView = nil;
    [self addSubview:self.centerView];
    self.titleLable.text = self.title;
    self.statusLable.text = self.statusTitle;
    if (self.statusTitle) {
        self.statusLable.frame = CGRectMake(0, [self.centerView bottom], [self width], [self height]- [self.centerView bottom]);
        self.statusLable.text = self.statusTitle;
    }else{
        self.statusLable.frame = CGRectZero;
    }
    
    [self refreshFrame];
}

-(void)refreshFrame{
    // 更新自身frame
    CGFloat heightTitle = [self textHeightFromTextString:self.title width:[self width]fontSize:FontSize];
    NSInteger rowTitle = heightTitle/ ProgressRowHeight;
    
    CGFloat heightStatus = [self textHeightFromTextString:self.statusTitle width:[self width] fontSize:FontSize];
    NSInteger rowStatus = heightStatus / ProgressRowHeight;
    
    NSInteger rows = rowTitle + rowStatus ;
    
    CGRect frameTmp = self.frame;
    frameTmp.size.height += rows * ProgressRowHeight;
    self.frame = frameTmp;
    
    // 更新title
    CGRect frameTitle = self.titleLable.frame;
    frameTitle.size.height = (rowTitle + 1) * ProgressRowHeight;
    self.titleLable.frame = frameTitle;
    
    // 更新指示器
    CGRect frameCenter = self.centerView.frame;
    frameCenter.origin.y = [self.titleLable bottom];
    self.centerView.frame = frameCenter;
    
    // 更新状态lable
    CGRect frameStatus = self.statusLable.frame;
    frameStatus.origin.y = [self.centerView bottom];
    frameStatus.size.height = (rowStatus + 1) * ProgressRowHeight;
    self.statusLable.frame = frameStatus;
}

-(UIView *)centerView{
    if (!_centerView) {
        if (self.style == TSProgressImageStyle) {
            if (self.arrayImages.count == 0) {
                _centerView = [[UIView alloc]initWithFrame:CGRectZero];
            }else{
                _centerView = [[UIView alloc]initWithFrame:CGRectMake(0, [self.titleLable bottom], [self width], [self height] / 3)];
                [_centerView addSubview:[self centerView]];
            }
        }else if (self.style == TSProgressIndicatorstyle){
            
            _centerView = [[UIView alloc]initWithFrame:CGRectMake(0, [self.titleLable bottom], [self width], [self height] / 3)];
            [_centerView addSubview:[self indicator]];
            
        }else{
            _centerView = [[UIView alloc]initWithFrame:CGRectZero];
        }
    }
    return _centerView;
}

-(UIActivityIndicatorView*)indicator{
    static UIActivityIndicatorView * indicator;
    if (indicator == nil) {
        indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        indicator.frame = CGRectMake(([_centerView width] - ProgressRowHeight)/2, 0, ProgressRowHeight, ProgressRowHeight );
        NSLog(@"%@",indicator);
        indicator.backgroundColor = [UIColor clearColor];
        [indicator startAnimating];
    }
    return indicator;
}

-(UIImageView*)centerImageView{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.centerView.frame];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.animationImages = self.arrayImages;
    imageView.animationDuration = 3;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
    return imageView;
}

-(UILabel *)statusLable{
    if (!_statusLable) {
        _statusLable = [[UILabel alloc]initWithFrame:CGRectMake(0, [self.centerView bottom], [self width], [self height]- [self.centerView bottom])];
        _statusLable.textAlignment = NSTextAlignmentCenter;
        _statusLable.textColor = [UIColor whiteColor];
        _statusLable.font = [UIFont systemFontOfSize:13];
        _statusLable.backgroundColor = [UIColor clearColor];
        _statusLable.numberOfLines = 0;
        _statusLable.text = self.statusTitle;
    }
    return _statusLable;
}

-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [self width], [self height] / 3)];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.textColor = [UIColor whiteColor];
        _titleLable.font = [UIFont systemFontOfSize:13];
        _titleLable.backgroundColor = [UIColor clearColor];
        _titleLable.numberOfLines = 0;
        _titleLable.text = self.title;
    }
    return _titleLable;
}


// 绘图
-(void)drawRect:(CGRect)rect{
    
    self.alpha = 0.7;
    
//    self.backgroundColor = [UIColor clearColor];
    
    // 获取当前layer
    CALayer * layer = [self layer];
    
    // path
    CGRect shadowPath = CGRectMake([self left] - ShadowWidth, [self up] - ShadowWidth, [self width] + 2 * ShadowWidth, [self height] + 2 * ShadowWidth);
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:shadowPath];
    layer.shadowPath = path.CGPath;
    
    
    layer.shadowOffset = CGSizeMake(-shadowPath.origin.x - ShadowWidth /2, -shadowPath.origin.y - ShadowWidth /2);
    
    layer.shadowRadius = ShadowWidth ;
    
    layer.shadowOpacity = 0.7;
    
    self.shadowColor = [UIColor blackColor];
    layer.shadowColor = [self.shadowColor CGColor];
    
}


/*
 *根据字符串的实际内容的多少 在固定的宽度和字体的大小，动态的计算出实际的高度
 */
- (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size{
    if (text.length == 0) {
        return 0;
    }
        NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
        CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil];
        //返回计算出的行高
        return rect.size.height;
}

@end

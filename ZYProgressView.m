//
//  ZYProgressView.m
//  进度条自定义
//
//  Created by space on 15/5/7.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import "ZYProgressView.h"

@implementation ZYProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.pgv=[[ProgressGradientView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:self.pgv];
        self.backGroundImage = [[UIImageView alloc]initWithFrame:CGRectMake(-12, -40, 50, 40)];
        self.backGroundImage.image = [UIImage imageNamed:@"a"];
        [self addSubview:self.backGroundImage];
        self.progress = [[UILabel alloc]initWithFrame:CGRectMake(10, 8, 35, 20)];
        self.progress.text = @"0%";
        self.progress.font = [UIFont systemFontOfSize:12];
        self.progress.textColor = [UIColor redColor];
        self.progress.textAlignment = NSTextAlignmentCenter;
        [self.backGroundImage addSubview:self.progress];
    }
    return self;
}

- (void)animation:(CGFloat)afloat {
    int i = afloat*100;
    self.progress.text = [NSString stringWithFormat:@"%d%%",i];
    CGRect rect = self.backGroundImage.frame;
    rect.origin.x = self.frame.size.width*afloat-12;
    self.backGroundImage.frame = rect;
    [self.pgv setProgress:afloat];
    
}

@end

//
//  ZYProgressView.h
//  进度条自定义
//
//  Created by space on 15/5/7.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressGradientView.h"

@interface ZYProgressView : UIView
@property(nonatomic,strong)ProgressGradientView *pgv;
@property(nonatomic,strong)UIImageView *backGroundImage;
@property(nonatomic,strong)UILabel *progress;
- (void)animation:(CGFloat)afloat;
@end

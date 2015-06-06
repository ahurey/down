//
//  ZYDownloading.h
//  多任务断点下载
//
//  Created by space on 15/5/8.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYDownloading : NSObject
-(void)ZZZ:(UIAlertView *)av;
+(void)startDownload:(NSString *)url savePath:(NSString *)savePath completion:(void (^)(id))block failure:(void (^)(NSString *))failure;
@end

//
//  ZYDownloading.m
//  多任务断点下载
//
//  Created by space on 15/5/8.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import "ZYDownloading.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "AFDownloadRequestOperation.h"
#import "ZYProgressView.h"

@implementation ZYDownloading



+(void)startDownload:(NSString *)url savePath:(NSString *)savePath completion:(void (^)(id))block failure:(void (^)(NSString *))failure
{
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    if ([fileManager fileExistsAtPath:savePath]) {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:nil message:@"文件已下载完成" delegate:self cancelButtonTitle:nil otherButtonTitles:@"喔", nil];
        [av show];
        
        NSLog(@"AAAAAAAAAAAAA%@",savePath);
        return;
    }else{
        NSLog(@"文件不存在");
    }
    NSURL *aUrl = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:aUrl cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:3600];
    
    AFDownloadRequestOperation *operation = [[AFDownloadRequestOperation alloc]initWithRequest:request targetPath:savePath shouldResume:YES];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Successfully downloaded file to %@", savePath);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [[NSURLCache sharedURLCache] removeCachedResponseForRequest:request];
    //下载控制
    [operation setProgressiveDownloadProgressBlock:^(AFDownloadRequestOperation *operation, NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpected, long long totalBytesReadForFile, long long totalBytesExpectedToReadForFile) {
        NSString *progress = [NSString stringWithFormat:@"%lf",(float)totalBytesReadForFile/totalBytesExpectedToReadForFile];
        if (block) {
            block(progress);
            NSLog(@"\n\n%@",progress);
        }
    }];
    [operation start];
}


-(void)ZZZ:(UIAlertView *)av
{
    [av dismissWithClickedButtonIndex:0 animated:YES];
}
@end

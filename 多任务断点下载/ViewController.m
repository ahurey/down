//
//  ViewController.m
//  多任务断点下载
//
//  Created by space on 15/5/7.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "AFDownloadRequestOperation.h"
#import "ZYProgressView.h"
#import "ZYDownloading.h"

#define aUrlDown @"http://download.3g.joy.cn/video/232/60232043/1427248039031_hd.mp4"
#define bUrlDown @"http://61.142.132.138/youku/67727BD078B3C8223E6A486F78/0300080100514CDCC117ED01BB9D9D61CCFE71-3919-AADA-2135-9ACFAF0A1691.mp4"
#define cUrlDown @"http://113.107.56.179/vod.cntv.lxdns.com/flash/mp4video13/TMS/2011/08/08/60503EC9A5D74c6f83EF9353E1D15B5B_h264418000nero_aac32.mp4?wshc_tag=0&wsts_tag=554c105d&wsid_tag=71741707&wsiphost=ipdbm"

@interface ViewController ()
- (IBAction)down1:(id)sender;
- (IBAction)down2:(id)sender;
- (IBAction)down3:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tf;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)down1:(id)sender {
    __block ZYProgressView *zy;
    [ZYDownloading startDownload:aUrlDown savePath:@"/Users/space/Desktop/1.MP4" completion:^(id obj) {
        CGFloat f = [obj floatValue];
        
        if (!zy) {
            zy = [[ZYProgressView alloc]initWithFrame:CGRectMake(10, 100, 300, 10)];
            [self.view addSubview:zy];
        }
        [zy animation:f];
    } failure:^(NSString *oo) {
        NSLog(@"AAAAAAA%@",oo);
    }];
}

- (IBAction)down2:(id)sender {
    __block ZYProgressView *zy;
    [ZYDownloading startDownload:bUrlDown savePath:@"/Users/space/Desktop/2.MP4" completion:^(id obj) {
        CGFloat f = [obj floatValue];
        
        if (!zy) {
            zy = [[ZYProgressView alloc]initWithFrame:CGRectMake(10, 200, 300, 10)];
            [self.view addSubview:zy];
        }
        [zy animation:f];    } failure:^(NSString *oo) {
        NSLog(@"BBBBBBBB%@",oo);
    }];
}

- (IBAction)down3:(id)sender {
    __block ZYProgressView *zy;

    [ZYDownloading startDownload:cUrlDown savePath:@"/Users/space/Desktop/3.MP4" completion:^(id obj) {
        CGFloat f = [obj floatValue];
        if (!zy) {
            zy = [[ZYProgressView alloc]initWithFrame:CGRectMake(10, 300, 300, 10)];
            [self.view addSubview:zy];
        }

        [zy animation:f];
    } failure:^(NSString *oo) {
        NSLog(@"CCCCCCCCC%@",oo);
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.tf resignFirstResponder];
}
@end

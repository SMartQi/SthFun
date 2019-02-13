//
//  Snapshot.m
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/23.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import "Snapshot.h"
#import <WebKit/WebKit.h>

@implementation Snapshot

+ (void)snapshot;
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 100)];
    btn.backgroundColor = [UIColor redColor];
    [view addSubview:btn];
    
    WKWebView *wv = [[WKWebView alloc] initWithFrame:CGRectMake(0, 100, [[UIScreen mainScreen] bounds].size.width, 300)];
    [wv loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    [view addSubview:wv];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 400, [[UIScreen mainScreen] bounds].size.width, 100)];
    view1.backgroundColor = [UIColor yellowColor];
    [view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width / 2, 50)];
    view2.backgroundColor = [UIColor magentaColor];
    [view1 addSubview:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 100, [[UIScreen mainScreen] bounds].size.width, 100)];
    view3.backgroundColor = [UIColor cyanColor];
    [view addSubview:view3];
    
    // 等待3s，loadURL完成
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        NSArray *windowArray = [UIApplication sharedApplication].windows;
        BOOL validScreenshotImage = NO;
        UIGraphicsBeginImageContextWithOptions(screenSize, NO, [UIScreen mainScreen].scale);
        for (UIWindow *window in windowArray) {
            //不绘制隐藏、键盘、警告、夜间模式 Window
            if ( window.hidden || (window.windowLevel >= UIWindowLevelAlert) || ([window isKindOfClass:NSClassFromString(@"UITextEffectsWindow")]) ) {
                continue;
            }
            if (!(window.frame.size.width > 0 && window.frame.size.height > 0)) {
                continue;
            }
            @try {
                if (![window drawViewHierarchyInRect:window.frame
                                  afterScreenUpdates:YES]){
                    [window.layer renderInContext:UIGraphicsGetCurrentContext()];
                }
                validScreenshotImage = YES;
            }
            @catch(NSException *exception) {
                continue;
            }
        }
        
        // 获取整个页面图像
        UIImage *screenImage = nil;
        if (validScreenshotImage) {
            screenImage = UIGraphicsGetImageFromCurrentImageContext();
        }
        UIGraphicsEndImageContext();
        
        for (int i = 1; i <= 10; i++) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSData *data = UIImageJPEGRepresentation(screenImage, i * 0.1);
                NSLog(@"%ld %lu", (long)i, (unsigned long)data.length);
                UIImageView *snapshotView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 0.8, [UIScreen mainScreen].bounds.size.height * 0.8)];
                UIImage *compressedImage = [UIImage imageWithData:data];
                snapshotView.image = compressedImage;
                [[UIApplication sharedApplication].keyWindow addSubview:snapshotView];
            });
        }
        /*
         2019-02-13 19:20:47.045547+0800 SthFun[49302:553814] 1 68563
         2019-02-13 19:20:48.155826+0800 SthFun[49302:553814] 2 72138
         2019-02-13 19:20:49.255986+0800 SthFun[49302:553814] 3 79349
         2019-02-13 19:20:50.357410+0800 SthFun[49302:553814] 4 88666
         2019-02-13 19:20:51.456286+0800 SthFun[49302:553814] 5 99081
         2019-02-13 19:20:52.556381+0800 SthFun[49302:553814] 6 108452
         2019-02-13 19:20:53.652768+0800 SthFun[49302:553814] 7 120463
         2019-02-13 19:20:54.754046+0800 SthFun[49302:553814] 8 128384
         2019-02-13 19:20:55.856485+0800 SthFun[49302:553814] 9 142283
         2019-02-13 19:20:56.962404+0800 SthFun[49302:553814] 10 256783
         */
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication].keyWindow addSubview:view];
    });
}

@end

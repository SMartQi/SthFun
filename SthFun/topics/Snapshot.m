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
        
        UIImageView *snapShotView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 500 / [[UIScreen mainScreen] bounds].size.height * [[UIScreen mainScreen] bounds].size.width, 500)];
        snapShotView.image = screenImage;
        [view addSubview:snapShotView];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication].keyWindow addSubview:view];
    });
}

@end

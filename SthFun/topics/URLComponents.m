//
//  URLComponents.m
//  SthFun
//
//  Created by Qi,Simeng on 2019/1/21.
//  Copyright © 2019 Qi,Simeng. All rights reserved.
//

#import "URLComponents.h"

@implementation URLComponents

+ (void)components {
    NSURLComponents *components = [NSURLComponents componentsWithString:@"http://www.baidu.com?a=aa&b=bb"];
    
    // 删改components
    NSMutableArray *items = [components.queryItems mutableCopy];
    if (!items) {
        items = [NSMutableArray array];
    }
    
    for (int i = 0; i < items.count; i++) {
        NSURLQueryItem *item = items[i];
        if ([item.name isEqualToString:@"a"]) {
            [items removeObject:item];
            break;
        }
    }
    
    // 修改/添加 a
    NSURLQueryItem *item = [NSURLQueryItem queryItemWithName:@"a" value:@"aaaaa"];
    [items addObject:item];
    
    NSDictionary *tokenDic = @{@"key1": @{@"key2": @"value"}};
    NSData *tokenData = [NSJSONSerialization dataWithJSONObject:tokenDic
                                                        options:0
                                                          error:nil];
    if (tokenData) {
        NSString *tokenStr = [[NSString alloc] initWithData:tokenData
                                                   encoding:NSUTF8StringEncoding];
        if (tokenStr) {
            // NSURLQueryItem 会自动编码，不必手动对"{"等编码
            // 不会替换已有的"b"
            NSURLQueryItem *item = [NSURLQueryItem queryItemWithName:@"b" value:tokenStr];
            NSLog(@"item: %@", item);
            [items addObject:item];
        }
    }
    
    components.queryItems = items;
    NSLog(@"URL: %@", components.URL.absoluteString);
    
    // item: <NSURLQueryItem 0x60000335d6a0> {name = b, value = {"key1":{"key2":"value"}}}
    // URL: http://www.baidu.com?b=bb&a=aaaaa&b=%7B%22key1%22:%7B%22key2%22:%22value%22%7D%7D
}

@end

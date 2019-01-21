//
//  URLComponents.h
//  SthFun
//
//  Created by Qi,Simeng on 2019/1/21.
//  Copyright © 2019 Qi,Simeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLComponents : NSObject

/**
 删改components
 NSURLQueryItem 会自动编码，不必手动做escape
 新加NSURLQueryItem的时候，不会替换已有的同名key，需要自己处理remove或者replace
 */
+ (void)components;

@end

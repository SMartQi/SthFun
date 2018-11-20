//
//  ContainString.h
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/20.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContainString : NSObject

/**
 在NSArray中检测是否有目标string
 无论是@""生成的（常量区）或者是[NSString stringWithFormat:]生成的（堆或者栈），都只比较值。
 原因：NSArray的containsObject:对其中的元素调用了isEqual:方法，而NSString的isEqual:其实就是isEqualToString:。
 如果真的想检测指针是否相同，可以遍历元素，使用==比较；或者[stringArray indexOfObjectIdenticalTo:someString] != NSNotFound。
 */
+ (void)containString;

@end

NS_ASSUME_NONNULL_END

//
//  CallStack.h
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/27.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CallStack : NSObject

/**
 打印调用栈，解析一行的每个item
 */
+ (void)showCallStackSymbols;

@end

NS_ASSUME_NONNULL_END

//
//  NullValueInDictionary.h
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/22.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NullValueInDictionary : NSObject

/**
 构造崩溃：[NSNull objectForKey:]:unrecognized selector的case。
 一般情况下，NSDictionary里面不会出现空数据，oc代码直接构造的dic不允许nil的存在，所以这种崩溃日志比较奇怪。
 但是当dic是经由网络数据构造时，空数据可能会以NSNull的格式写入，后续操作时必须判断类型，否则会发生unrecognized selector崩溃。
 */
+ (void)crashedNullValue;

@end

NS_ASSUME_NONNULL_END

//
//  InfoForSymbolication.h
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/29.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 针对崩溃栈中的某一行做符号化：
 atos -o [UUID对应的dsym文件路径/Contents/Resources/DWARF/App名称] -arch [手机架构] -l [binaryImageAddress] [崩溃日志中的内存地址]
 */
@interface InfoForSymbolication : NSObject

/**
 获取手机架构
 
 @return 手机架构
 */
+ (NSString *)phoneArchitecture;

/**
 获取app的UUID
 
 @return app的UUID
 */
+ (NSString *)executableUUID;

/**
 获取app的binaryImageAddress
 
 @return app的binaryImageAddress
 */
NSString *binaryImageAddress(void);

@end

NS_ASSUME_NONNULL_END

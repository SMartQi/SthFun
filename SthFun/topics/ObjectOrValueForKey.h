//
//  ObjectOrValueForKey.h
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/19.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjectOrValueForKey : NSObject

/**
 比较NSDictionary和NSString的objectForKey和valueForKey
 对于NSDictionary来说:
 objectForKey的key必须是dic中key-value对中的key
 valueForKey的key是dic中key-value对中的key；或者NSDictionary的属性，但属性需要单独加@，即@"@property"
 然而！如果kv对中的key以@开头，objectForKey能正确获取，valueForKey会直接报错
 对于NSString及其他类来说：
 valueForKey的key是它的属性，且不需要加@
 */
+ (void)ofkVSvfk;

@end

NS_ASSUME_NONNULL_END

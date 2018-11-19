//
//  ObjectOrValueForKey.m
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/19.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import "ObjectOrValueForKey.h"

@implementation ObjectOrValueForKey

+ (void)ofkVSvfk
{
    NSDictionary *dic = @{@"allKeys": @"allValue", @"anotherKey": @"anotherValue", @"@specialKey": @"specialValue"};
    
    NSLog(@"1 %@", [dic objectForKey:@"allKeys"]);
    NSLog(@"2 %@", [dic objectForKey:@"allValues"]);
    NSLog(@"3 %@", [dic objectForKey:@"anotherKey"]);
    NSLog(@"4 %@", [dic objectForKey:@"@specialKey"]);
    
    NSLog(@"5 %@", [dic valueForKey:@"allKeys"]);
    NSLog(@"6 %@", [dic valueForKey:@"allValues"]);
    NSLog(@"7 %@", [dic valueForKey:@"anotherKey"]);
    //    NSLog(@"8 %@", [dic valueForKey:@"@specialKey"]);
    //    *** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<__NSDictionaryI 0x600000ee48c0> valueForUndefinedKey:]: this class is not key value coding-compliant for the key specialKey.'
    
    NSLog(@"9 %@", [dic valueForKey:@"@allKeys"]);
    NSLog(@"10 %@", [dic valueForKey:@"@allValues"]);
    //    NSLog(@"11 %@", [dic valueForKey:@"@specialKey"]);
    //    *** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<__NSDictionaryI 0x6000017d2940> valueForUndefinedKey:]: this class is not key value coding-compliant for the key specialKey.'
    //    NSLog(@"12 %@", [dic valueForKey:@"@anotherKey"]);
    //    *** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<__NSDictionaryI 0x60000122b300> valueForUndefinedKey:]: this class is not key value coding-compliant for the key anotherKey.'
    
    NSString *str = @"asdf";
    NSLog(@"%@", [str valueForKey:@"length"]);
    //    NSLog(@"%@", [str valueForKey:@"@length"]);
    //    *** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<__NSCFConstantString 0x10a0e24a8> valueForUndefinedKey:]: this class is not key value coding-compliant for the key @length.'
    
    /*
     2018-11-19 18:35:24.022491+0800 SthFun[97719:4474307] 1 allValue
     2018-11-19 18:35:24.022651+0800 SthFun[97719:4474307] 2 (null)
     2018-11-19 18:35:24.022729+0800 SthFun[97719:4474307] 3 anotherValue
     2018-11-19 18:35:24.022790+0800 SthFun[97719:4474307] 4 specialValue
     2018-11-19 18:35:24.022862+0800 SthFun[97719:4474307] 5 allValue
     2018-11-19 18:35:24.022923+0800 SthFun[97719:4474307] 6 (null)
     2018-11-19 18:35:24.022999+0800 SthFun[97719:4474307] 7 anotherValue
     2018-11-19 18:35:24.023196+0800 SthFun[97719:4474307] 9 (
     allKeys,
     anotherKey,
     "@specialKey"
     )
     2018-11-19 18:35:24.023493+0800 SthFun[97719:4474307] 10 (
     allValue,
     anotherValue,
     specialValue
     )
     2018-11-19 18:35:24.023929+0800 SthFun[97719:4474307] 4
     */
}

@end

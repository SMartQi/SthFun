//
//  LocationOfString.m
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/16.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import "LocationOfString.h"

@implementation LocationOfString


+ (void)location
{
    // @const
    NSString *cs1 = @"a";
    NSString *cs2 = @"a";
    NSString *cs3 = @"aaaaa";
    NSString *cs4 = @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    
    // format
    NSString *fs1 = [NSString stringWithFormat:@"%@", @"a"];
    NSString *fs11 = [NSString stringWithFormat:@"%@", @"a"];
    NSString *fs2 = [NSString stringWithFormat:@"%@", @"aaaaaaaaa"];
    NSString *fs22 = [NSString stringWithFormat:@"%@", @"aaaaaaaaa"];
    NSString *fs3 = [NSString stringWithFormat:@"%@", @"aaaaaaaaaa"];
    NSString *fs33 = [NSString stringWithFormat:@"%@", @"aaaaaaaaaa"];
    NSString *fs4 = [NSString stringWithFormat:@"%@", @"aaaaaaaaaaa"];
    NSString *fs44 = [NSString stringWithFormat:@"%@", @"aaaaaaaaaaa"];
    NSString *fs5 = [NSString stringWithFormat:@"%@", @"aaaaaaaaaaaa"];
    NSString *fs55 = [NSString stringWithFormat:@"%@", @"aaaaaaaaaaaa"];
    NSString *fs6 = [NSString stringWithFormat:@"%@", @"aaaaaaaaaaaaa"];
    NSString *fs66 = [NSString stringWithFormat:@"%@", @"aaaaaaaaaaaaa"];
    NSString *fs7 = [NSString stringWithFormat:@"%@", @"aaaaaaaaaaaaaa"];
    NSString *fs77 = [NSString stringWithFormat:@"%@", @"aaaaaaaaaaaaaa"];
    NSString *fs8 = [NSString stringWithFormat:@"%@", @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"];
    NSString *fs88 = [NSString stringWithFormat:@"%@", @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"];
    
    // check the memory address
    NSLog(@"%@: %p", cs1, cs1);
    NSLog(@"%@: %p", cs2, cs2);
    NSLog(@"%@: %p", cs3, cs3);
    NSLog(@"%@: %p", cs4, cs4);
    
    NSLog(@"length%lu: %p", (unsigned long)fs1.length, fs1);
    NSLog(@"length%lu: %p", (unsigned long)fs11.length, fs11);
    NSLog(@"length%lu: %p", (unsigned long)fs2.length, fs2);
    NSLog(@"length%lu: %p", (unsigned long)fs22.length, fs22);
    NSLog(@"length%lu: %p", (unsigned long)fs3.length, fs3);
    NSLog(@"length%lu: %p", (unsigned long)fs33.length, fs33);
    NSLog(@"length%lu: %p", (unsigned long)fs4.length, fs4);
    NSLog(@"length%lu: %p", (unsigned long)fs44.length, fs44);
    NSLog(@"length%lu: %p", (unsigned long)fs5.length, fs5);
    NSLog(@"length%lu: %p", (unsigned long)fs55.length, fs55);
    NSLog(@"length%lu: %p", (unsigned long)fs6.length, fs6);
    NSLog(@"length%lu: %p", (unsigned long)fs66.length, fs66);
    NSLog(@"length%lu: %p", (unsigned long)fs7.length, fs7);
    NSLog(@"length%lu: %p", (unsigned long)fs77.length, fs77);
    NSLog(@"length%lu: %p", (unsigned long)fs8.length, fs8);
    NSLog(@"length%lu: %p", (unsigned long)fs88.length, fs88);
    
    /*
     2018-11-16 18:52:02.704113+0800 SthFun[4883:3730610] a: 0x107e37068
     2018-11-16 18:52:02.704229+0800 SthFun[4883:3730610] a: 0x107e37068
     2018-11-16 18:52:02.704293+0800 SthFun[4883:3730610] aaaaa: 0x107e37088
     2018-11-16 18:52:02.704378+0800 SthFun[4883:3730610] aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa: 0x107e370a8
     2018-11-16 18:52:02.704440+0800 SthFun[4883:3730610] length1: 0xa23402c72627ad68
     2018-11-16 18:52:02.704499+0800 SthFun[4883:3730610] length1: 0xa23402c72627ad68
     2018-11-16 18:52:02.704564+0800 SthFun[4883:3730610] length9: 0xa2b60ae7a42f8bf0
     2018-11-16 18:52:02.704623+0800 SthFun[4883:3730610] length9: 0xa2b60ae7a42f8bf0
     2018-11-16 18:52:02.704698+0800 SthFun[4883:3730610] length10: 0xa22486e62e65bbf3
     2018-11-16 18:52:02.704862+0800 SthFun[4883:3730610] length10: 0xa22486e62e65bbf3
     2018-11-16 18:52:02.705052+0800 SthFun[4883:3730610] length11: 0xa02486e62e65bbf2
     2018-11-16 18:52:02.705299+0800 SthFun[4883:3730610] length11: 0xa02486e62e65bbf2
     2018-11-16 18:52:02.705505+0800 SthFun[4883:3730610] length12: 0x60000203df20
     2018-11-16 18:52:02.705716+0800 SthFun[4883:3730610] length12: 0x60000203dd60
     2018-11-16 18:52:02.705916+0800 SthFun[4883:3730610] length13: 0x60000203df00
     2018-11-16 18:52:02.706100+0800 SthFun[4883:3730610] length13: 0x60000203de80
     2018-11-16 18:52:02.706303+0800 SthFun[4883:3730610] length14: 0x60000203dfe0
     2018-11-16 18:52:02.706948+0800 SthFun[4883:3730610] length14: 0x60000203df80
     2018-11-16 18:52:02.707029+0800 SthFun[4883:3730610] length70: 0x6000004791a0
     2018-11-16 18:52:02.707099+0800 SthFun[4883:3730610] length70: 0x6000004792c0
     */
}

@end


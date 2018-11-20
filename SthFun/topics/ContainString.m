//
//  ContainString.m
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/20.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import "ContainString.h"

@implementation ContainString

+ (void)containString
{
    NSString *sInArray = [NSString stringWithFormat:@"%@", @"s"];
    NSString *sNotInArray = [NSString stringWithFormat:@"%@", @"a"];
    NSArray *a = @[sInArray, @"a"];
    
    NSLog(@"compare way:              @\"a\"\t@\"s\"\tin\tnotIn");
    NSLog(@"---------------------------------------------------");
    
    BOOL contain1 = [a containsObject:@"a"];
    BOOL contain2 = [a containsObject:@"s"];
    BOOL contain3 = [a containsObject:sInArray];
    BOOL contain4 = [a containsObject:sNotInArray];
    
    NSLog(@"containsObject:           %d    \t%d    \t%d    \t%d", contain1, contain2, contain3, contain4);
    
    BOOL contain5 = ([a indexOfObjectIdenticalTo:@"a"] != NSNotFound);
    BOOL contain6 = ([a indexOfObjectIdenticalTo:@"s"] != NSNotFound);
    BOOL contain7 = ([a indexOfObjectIdenticalTo:sInArray] != NSNotFound);
    BOOL contain8 = ([a indexOfObjectIdenticalTo:sNotInArray] != NSNotFound);
    
    NSLog(@"indexOfObjectIdenticalTo: %d    \t%d    \t%d    \t%d", contain5, contain6, contain7, contain8);
    
    BOOL contain9 = NO;
    BOOL contain10 = NO;
    BOOL contain11 = NO;
    BOOL contain12 = NO;
    
    for (NSString *s in a) {
        if (s == @"a") {
            contain9 = YES;
        }
    }
    for (NSString *s in a) {
        if (s == @"s") {
            contain10 = YES;
        }
    }
    for (NSString *s in a) {
        if (s == sInArray) {
            contain11 = YES;
        }
    }
    for (NSString *s in a) {
        if (s == sNotInArray) {
            contain12 = YES;
        }
    }
    
    NSLog(@"use == to compare item:   %d    \t%d    \t%d    \t%d", contain9, contain10, contain11, contain12);
    
    /*
     compare way:              @"a"    @"s"    in    notIn
     ------------------------------------------------------
     containsObject:           1        1        1        1
     indexOfObjectIdenticalTo: 1        0        1        0
     use == to compare item:   1        0        1        0
     */
}

@end

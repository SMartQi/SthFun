//
//  CallStack.m
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/27.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import "CallStack.h"

@implementation CallStack

+ (void)showCallStackSymbols
{
    NSArray *stack = [NSThread callStackSymbols];
    NSLog(@"%@", stack);
    
    NSString *sourceString = [stack objectAtIndex:0];
    NSCharacterSet *separatorSet = [NSCharacterSet characterSetWithCharactersInString:@" -[]+?.,"];
    NSMutableArray *array = [NSMutableArray arrayWithArray:[sourceString  componentsSeparatedByCharactersInSet:separatorSet]];
    [array removeObject:@""];
    
    NSLog(@"Stack = %@", [array objectAtIndex:0]);
    NSLog(@"Framework = %@", [array objectAtIndex:1]);
    NSLog(@"Memory address = %@", [array objectAtIndex:2]);
    NSLog(@"Class caller = %@", [array objectAtIndex:3]);
    NSLog(@"Function caller = %@", [array objectAtIndex:4]);
    
    /*
     
     */
}

@end

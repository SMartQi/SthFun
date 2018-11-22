//
//  ViewController.m
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/16.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import "ViewController.h"
#import "NullValueInDictionary.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NullValueInDictionary crashedNullValue];
}


@end

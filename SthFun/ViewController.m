//
//  ViewController.m
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/16.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import "ViewController.h"
#import "InfoForSymbolication.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [InfoForSymbolication phoneArchitecture];
    [InfoForSymbolication executableUUID];
    binaryImageAddress();
}


@end

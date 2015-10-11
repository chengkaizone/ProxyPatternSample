//
//  ViewController.m
//  ProxyPatternSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "ViewController.h"
#import "MessageProtocol.h"
#import "ConcreteProxy.h"


/**
 *  代理模式的简单运用,这个比较绕,我自己也有些晕,用到了c语言的库
 *  参考自大师YouXianMing的设计模式理解
 */
@interface ViewController () <MessageProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ConcreteProxy *proxy = [[ConcreteProxy alloc] initWithProxy:self];
    
    [proxy helloDesign];
    
    [proxy bye];
    
    
}

- (void)helloDesign {
    NSLog(@"Hello 设计模式.");
}

//- (void)bye {
//    NSLog(@"Good Bye.");
//}

@end

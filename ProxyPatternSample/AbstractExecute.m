//
//  AbstractExecute.m
//  ProxyPatternSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "AbstractExecute.h"

@implementation AbstractExecute

+ (instancetype)sharedInstance {
    static AbstractExecute *execute = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        execute = [AbstractExecute new];
    });
    
    return execute;
}

- (void)nullExecute:(NSArray *)className {
    if (className) {
        for (id obj in className) {
            NSLog(@"obj:%@", [obj description]);
        }
    }
    if (className.count == 3) {
        
        NSLog(@"%@ 设置了代理,但该代理没有实现 %@ 方法", className[0], className[1]);
        
    } else {
        
        NSLog(@"%@ 没有设置代理,方法 %@ 没有执行", className[0], className[1]);
    }

}


@end

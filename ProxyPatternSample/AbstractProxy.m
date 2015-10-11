//
//  AbstractProxy.m
//  ProxyPatternSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "AbstractProxy.h"
#import "AbstractExecute.h"
#import <objc/runtime.h>

@implementation AbstractProxy

- (instancetype)initWithProxy:(id)proxy {

    self.proxy = proxy;
    
    return self;
}

#pragma mark - NSProxy

- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL selector = [invocation selector];
    
    if ([self.proxy respondsToSelector:selector]) {
        [invocation setTarget:self.proxy];
        [invocation invoke];
    }else{
        NSString *selectorString = NSStringFromSelector([invocation selector]);
        invocation.selector = NSSelectorFromString(@"nullExecute:");
        AbstractExecute *execute = [AbstractExecute sharedInstance];
        [invocation setTarget:execute];
        
        const char *className = class_getName([self class]);
        NSArray *classNameArray = nil;
        if(self.proxy) {
            classNameArray = @[[NSString stringWithUTF8String:className], selectorString, @""];
        }else{
            classNameArray = @[[NSString stringWithUTF8String:className], selectorString];
        }
        
        [invocation setArgument:&classNameArray atIndex:2];
        [invocation invoke];
    }
    
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if ([self.proxy respondsToSelector:sel]) {
        return [self.proxy methodSignatureForSelector:sel];
    } else {
        return [[AbstractExecute sharedInstance] methodSignatureForSelector:NSSelectorFromString(@"nullExecute:")];
    }
}

@end

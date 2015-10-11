//
//  AbstractProxy.h
//  ProxyPatternSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbstractProxy : NSProxy

/**
 *  被代理的对象
 */
@property (nonatomic, strong) id proxy;

/**
 *  使用被代理对象初始化
 *
 *  @param proxy 被代理对象
 *
 *  @return 返回代理
 */
- (instancetype)initWithProxy:(id)proxy;

@end

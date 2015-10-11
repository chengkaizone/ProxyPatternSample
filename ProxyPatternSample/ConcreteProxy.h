//
//  ConcreteProxy.h
//  ProxyPatternSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "AbstractProxy.h"
#import "MessageProtocol.h"

@interface ConcreteProxy : AbstractProxy <MessageProtocol>

@end

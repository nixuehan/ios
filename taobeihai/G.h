//
//  G.h
//  taobeihai
//
//  Created by 北海365技术部 on 13-8-23.
//  Copyright (c) 2013年 淘北海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "JSONKit.h"

//m 的 全局方法参数等
@interface _Object : NSObject
- (ASIHTTPRequest *) loadUrlDataJson:(NSString *)url andDelegate:(id)_self;
- (NSMutableDictionary *) asiToDictionary:(ASIHTTPRequest *)rq;
+ (NSMutableDictionary *) toArray:(NSString *)jsonStr;
@end

//全局
@interface G : _Object

@end

//
//  G.m
//  taobeihai
//
//  Created by 北海365技术部 on 13-8-23.
//  Copyright (c) 2013年 淘北海. All rights reserved.
//

#import "G.h"

//m的全局
@implementation _Object
- (ASIHTTPRequest *) loadUrlDataJson:(NSString *)url andDelegate:(id)_self
{
    NSURL *_url = [NSURL URLWithString:url];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:_url];
    [request setDelegate:_self];
    [request startAsynchronous];
    return request;
}

- (NSMutableDictionary *) asiToDictionary:(ASIHTTPRequest *)rq
{
    NSString *s = [rq responseString];
    NSMutableDictionary *data = [G toArray:s];
    return data;
    
}

+ (NSMutableDictionary *) toArray:(NSString *)jsonStr
{
    return [jsonStr mutableObjectFromJSONString];
    
    //NSLog(@"%@",[data objectForKey:@"ext"]);
    //NSLog(@"%@",[[data objectForKey:@"ext"] objectForKey:@"permitcode"]);
}
@end

//公共文件
@implementation G

@end

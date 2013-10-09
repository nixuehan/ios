//
//  TBConfig.h
//  taobeihai
//
//  Created by 北海365技术部 on 13-8-22.
//  Copyright (c) 2013年 淘北海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBConfig : _Object

//是否已经登录
@property BOOL isLogin;

-(void) Hello;

+(NSDictionary *) userData;

+(TBConfig *) Instance;
@end

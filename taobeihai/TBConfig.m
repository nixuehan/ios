//
//  TBConfig.m
//  taobeihai
//
//  Created by 北海365技术部 on 13-8-22.
//  Copyright (c) 2013年 淘北海. All rights reserved.
//

#import "TBConfig.h"

@implementation TBConfig


//是否已经登录
-(void) Hello
{
    NSLog(@"hellow....------");
}

//获取已登录用户数据
+(NSDictionary *) userData
{
    NSUserDefaults *set = [NSUserDefaults standardUserDefaults];
    NSString *userName = [set objectForKey:@"userName"];
    NSString *passWord = [set objectForKey:@"passWord"];
    
    if([userName isEqualToString:@""]){
        return NO;
    }

    return [[NSDictionary alloc]
                       initWithObjectsAndKeys:userName,userName,passWord,passWord, nil];
}


//单例
static TBConfig * instance = nil;

+(TBConfig *) Instance
{
    @synchronized(self)
    {
        if(nil == instance)
        {
            [self new];
        }
    }
    return instance;
}
+(id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if(instance == nil)
        {
            instance = [super allocWithZone:zone];
            return instance;
        }
    }
    return nil;
}

@end

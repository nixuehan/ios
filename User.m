//
//  User.m
//  taobeihai
//
//  Created by 北海365技术部 on 13-8-23.
//  Copyright (c) 2013年 淘北海. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithSelf:(id)_LoginSelf
{    
    if(self = [super init]){
        request = [self loadUrlDataJson:@"http://www.taobeihai.com/mobile.php?do=auth&ac=login&user=13677799890&password=cat051111"
                  andDelegate:_LoginSelf];

    }
    return self;
}

- (void)dealloc
{
    [request clearDelegatesAndCancel];
    [request release];
    [super dealloc];
}
@end

//
//  Login.m
//  taobeihai
//
//  Created by 北海365技术部 on 13-8-22.
//  Copyright (c) 2013年 淘北海. All rights reserved.
//

#import "Login.h"

@interface Login ()

@end

@implementation Login

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //初始化 user module
        
        /*
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        [self.view bringSubviewToFront:HUD];
        HUD.labelText = @"加载中....";
        [HUD show:YES];*/
        
        self.user = [[User alloc] initWithSelf:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//用户登录
- (IBAction)click_Login:(id)sender
{
    
    /*   post block 例子
    NSURL *url = [NSURL URLWithString:@"http://allseeing-i.com"];
    __block ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    [request setCompletionBlock:^{
        // Use when fetching text data
        NSString *responseString = [request responseString];
        NSLog(@"%@",responseString);
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
    }];
    
    [request addPostValue:@"xxoo" forKey:@"xxoo"];
    [request startAsynchronous];
    */
    
    
    NSURL *url = [NSURL URLWithString:@"http://allseeing-i.com"];
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setCompletionBlock:^{
        // Use when fetching text data
        NSString *responseString = [request responseString];
        
        // Use when fetching binary data
        NSData *responseData = [request responseData];
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
    }];
    [request startAsynchronous];
    
    
    NSString *userName = self.userName.text;
    NSString *passWord = self.passWord.text;
    BOOL isRemember = self.isRemember.on;
    
    NSUserDefaults *set = [NSUserDefaults standardUserDefaults];
    [set setObject:userName forKey:@"userName"];
    [set setObject:passWord forKey:@"passWord"];
    [set setBool:isRemember forKey:@"isRemember"];
    [set synchronize];
    
    [TBConfig Instance].isLogin = YES;    
}

- (IBAction)textEnd:(id)sender
{
    [sender resignFirstResponder];
}

// 去拉json数据 异步回调
- (void)requestFinished:(ASIHTTPRequest *)request
{
    /*
    if(HUD){
        [HUD removeFromSuperview];
        [HUD release];
        HUD = nil;
    }*/
    
    NSMutableDictionary *data = [self.user asiToDictionary:request];
    
    NSLog(@"%@",[[data objectForKey:@"ext"] objectForKey:@"permitcode"]);
}


- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    
}

- (void)dealloc
{
    [super dealloc];
    [self.user release];
}

@end

//
//  Login.h
//  taobeihai
//
//  Created by 北海365技术部 on 13-8-22.
//  Copyright (c) 2013年 淘北海. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "MBProgressHUD.h"

@interface Login : UIViewController
{
    MBProgressHUD *HUD;
}

@property(nonatomic,assign) IBOutlet UITextField *userName;
@property(nonatomic,assign) IBOutlet UITextField *passWord;
@property(nonatomic,assign) IBOutlet UISwitch *isRemember;

@property(nonatomic,assign) User *user;

- (IBAction)click_Login:(id)sender;
- (IBAction)textEnd:(id)sender;

- (void)requestFinished:(ASIHTTPRequest *)request;
- (void)requestFailed:(ASIHTTPRequest *)request;

@end

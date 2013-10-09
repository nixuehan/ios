//
//  My.m
//  taobeihai
//
//  Created by 北海365技术部 on 13-8-20.
//  Copyright (c) 2013年 淘北海. All rights reserved.
//

#import "My.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"
#import "TBConfig.h"

@interface My ()

@end

@implementation My

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    //self.navigationItem.hidesBackButton = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *array = [[NSArray alloc] initWithObjects:@"美国", @"美国",@"美国",@"美国",@"美国",nil];
    self.list = array;
    
    NSURL *url = [NSURL URLWithString:@"http://www.taobeihai.com/mobile.php?do=auth&ac=login&user=13677799890&password=cat051111"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    //NSString *str = [request responseString];
    //NSDictionary *arr = [str objectFromJSONString];
    
    //NSLog(@"%@",[arr objectForKey:@"ext"]);
    //NSLog(@"%@",[[arr objectForKey:@"ext"] objectForKey:@"permitcode"]);
    
    //[array release];
    [[TBConfig Instance] Hello];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.list = nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:orderListID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderListID];
        
    }
                             
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.list objectAtIndex:row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.list count];
}

@end

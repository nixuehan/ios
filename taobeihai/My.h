//
//  My.h
//  taobeihai
//
//  Created by 北海365技术部 on 13-8-20.
//  Copyright (c) 2013年 淘北海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface My : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) NSArray *list;
@end

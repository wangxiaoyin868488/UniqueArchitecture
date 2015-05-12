//
//  HomePageViewController.m
//  UniqueArchitecture
//
//  Created by summer on 15/5/10.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "HomePageViewController.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@implementation HomePageViewController

- (void)dropViewDidBeginRefreshing:(id)sender{
    DBGLog(@"dropViewDidBeginRefreshing..");
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", @"text/javascript",nil];//设置相应内容类型
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:@"http://m.jd.com" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [self endRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [self endRefreshing];
    }];
    
    
   
}


- (void)beginRefreshing{
    [_refreshControl beginRefreshing];
    DBGLog(@"beginRefreshing..");
}

- (void)endRefreshing{
    [_refreshControl endRefreshing];
    DBGLog(@"endRefreshing..");
}

@end

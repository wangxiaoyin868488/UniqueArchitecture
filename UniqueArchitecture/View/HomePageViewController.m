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
    
    [manager GET:@"http://www.baidu.com" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
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

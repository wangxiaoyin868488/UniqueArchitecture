//
//  HomePageViewController.m
//  UniqueArchitecture
//
//  Created by summer on 15/5/10.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "HomePageViewController.h"
#import "News.h"
#import "HomeDao.h"

#define URL_DB @"http://www.weather.com.cn/adat/sk/101010100.html"

@implementation HomePageViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSLog(@"%@",documentDirectory);
    HomeDao *dao = [[HomeDao alloc] init];
    
    [dao insertWithDictionary:@{@"name":@"1",@"sid":@"2"}];
}

- (void)dropViewDidBeginRefreshing:(id)sender{
    DBGLog(@"dropViewDidBeginRefreshing..");
    
    NSString *urlString = [NSString stringWithFormat:@"%@",URL_DB];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", @"text/javascript",nil];//设置相应内容类型
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSDictionary *tem = [dic objectForKey:@"weatherinfo"];
        
        NSError *error = nil;
        News *new = [MTLJSONAdapter modelOfClass:News.class fromJSONDictionary:tem error:&error];
        
        NSLog(@"%@",new.city);
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

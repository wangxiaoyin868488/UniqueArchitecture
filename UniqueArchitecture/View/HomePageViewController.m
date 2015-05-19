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
#import "HomeViewCell.h"
#import "DetailViewController.h"
#import "UANewWebViewController.h"

#define URL_DB @"http://www.weather.com.cn/adat/sk/101010100.html"

@implementation HomePageViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Index";
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSLog(@"%@",documentDirectory);
    HomeDao *dao = [[HomeDao alloc] init];
    
    News *news = [[News alloc] init];
    news.city = @"sh";
    news.time = @"123";
    [dao insertWithNews:news];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark -  method

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

#pragma mark - UITableViewDelegate method-
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellidentifier";
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[HomeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row%2 == 0) {
        DetailViewController *detailVC = [[DetailViewController alloc] init];
        [self.navigationController pushViewController:detailVC animated:YES];
    }else{
        UANewWebViewController *webView = [[UANewWebViewController alloc] init];
        [self.navigationController pushViewController:webView animated:YES];

    }
}
@end

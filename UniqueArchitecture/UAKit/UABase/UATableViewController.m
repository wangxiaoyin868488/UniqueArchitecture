//
//  UATableViewController.m
//  UniqueArchitecture
//
//  Created by summer on 15/5/8.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "UATableViewController.h"

@implementation UATableViewController

- (instancetype)init{
    self = [super init];
    
    if (self) {
        //
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    //
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark -
- (void)setUI{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _refreshControl = [[ODRefreshControl alloc] initInScrollView:_tableView];
    [_refreshControl addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark- UITableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"UABaseCellIdentifier";
    UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

#pragma mark- method
- (void)dropViewDidBeginRefreshing:(id)sender{
    DBGLog(@"dropViewDidBeginRefreshing..");
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

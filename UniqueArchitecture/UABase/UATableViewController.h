//
//  UATableViewController.h
//  UniqueArchitecture
//
//  Created by summer on 15/5/8.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAViewController.h"
#import <ODRefreshControl/ODRefreshControl.h>

@interface UATableViewController : UAViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView     *_tableView;
    ODRefreshControl*_refreshControl;
}

@property (nonatomic,strong) NSArray  *dataArray;

@end

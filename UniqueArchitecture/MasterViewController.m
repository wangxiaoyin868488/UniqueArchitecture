//
//  MasterViewController.m
//  UniqueArchitecture
//
//  Created by summer on 15/5/8.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MasterViewController.h"
#import "HomePageViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    NSArray *array = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action1:(id)sender {
    HomePageViewController *tableVC = [[HomePageViewController alloc] init];
    [self presentViewController:tableVC animated:YES completion:nil];
}
@end

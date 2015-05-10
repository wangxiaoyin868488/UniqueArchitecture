//
//  UAViewController.m
//  UniqueArchitecture
//
//  Created by summer on 15/5/8.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "UAViewController.h"

@implementation UAViewController

- (instancetype)init{
    self = [super init];
    
    if (self) {
        //
    }
    return  self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

@end

//
//  DetailViewController.m
//  UniqueArchitecture
//
//  Created by ccguo on 15/5/18.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        //
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)setUI{
    //登陆框
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScaleNum(20), kScaleNum(100), kScaleNum(100), kScaleNum(30))];
    [userNameLabel setText:@"UserName:"];
    [userNameLabel setTextAlignment:NSTextAlignmentLeft];
    [userNameLabel setTextColor:[UIColor blackColor]];
    [self.view addSubview:userNameLabel];
    
    UITextField *userNameTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(userNameLabel.frame), CGRectGetMinY(userNameLabel.frame), SCREEN_WIDTH-CGRectGetWidth(userNameLabel.frame)-kScaleNum(20)-10, kScaleNum(30))];
    [userNameTextFiled setPlaceholder:@"username.."];
    [userNameTextFiled.layer setBorderColor:[UIColor blackColor].CGColor];
    [userNameTextFiled.layer setBorderWidth:0.5];
    [self.view addSubview:userNameTextFiled];
    
    
    UILabel *pwdLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScaleNum(20), kScaleNum(100)+CGRectGetHeight(userNameLabel.frame), kScaleNum(100), kScaleNum(30))];
    [pwdLabel setText:@"Pwd:"];
    [pwdLabel setTextAlignment:NSTextAlignmentLeft];
    [pwdLabel setTextColor:[UIColor blackColor]];
    [self.view addSubview:pwdLabel];
    
    UITextField *pwdTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pwdLabel.frame), CGRectGetMinY(pwdLabel.frame), SCREEN_WIDTH-CGRectGetWidth(pwdLabel.frame)-kScaleNum(20)-10, kScaleNum(30))];
    [pwdTextFiled setPlaceholder:@"pwd.."];
    [pwdTextFiled.layer setBorderColor:[UIColor blackColor].CGColor];
    [pwdTextFiled.layer setBorderWidth:0.5];
    [self.view addSubview:pwdTextFiled];
    
    
    //login
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-kScaleNum(150))/2, SCREEN_HEIGHT-64-kScaleNum(35)-10, kScaleNum(150), kScaleNum(35))];
    [loginButton setBackgroundColor:[UIColor redColor]];
    [loginButton setAlpha:0.8];
    [loginButton setTitle:@"login" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}

- (void)loginAction:(id)sender{
    NSLog(@"loging...");
}
@end

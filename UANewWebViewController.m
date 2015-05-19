//
//  UANewWebViewController.m
//  UniqueArchitecture
//
//  Created by ccguo on 15/5/14.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "UANewWebViewController.h"

@interface UANewWebViewController ()<UIWebViewDelegate>{
    UIWebView *_webView;
}

@end

@implementation UANewWebViewController

- (instancetype)initWithUrlString:(NSString *)urlString{
    self = [super init];
    
    if (self) {
        //
        if ([urlString hasPrefix:@"http://"]) {
//            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//            [];
        }
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)setUI{
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareButton setBackgroundImage:[UIImage imageNamed:@"more_share"] forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
    [shareButton setFrame:CGRectMake(0, 0, 50, 35)];

    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:shareButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    UIButton *backToTopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backToTopBtn setBackgroundImage:[UIImage imageNamed:@"more_share"] forState:UIControlStateNormal];
    [backToTopBtn addTarget:self action:@selector(backToTopAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backToTopBtn];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)shareAction:(UIButton *)shareButton{
    
}

- (void)backToTopAction:(UIButton *)backbutton{

}

- (void)dealloc{
    _webView.delegate = nil;
}
@end

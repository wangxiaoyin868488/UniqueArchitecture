//
//  UAHttpRequest.m
//  UniqueArchitecture
//
//  Created by summer on 15/5/11.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "UAHttpRequest.h"

@implementation UAHttpRequest

+ (UAHttpRequest *)manager{
    return [[UAHttpRequest alloc] init];
}

- (instancetype)initWithRequest:(NSURLRequest *)request{
    self = [super init];
    
    if (self) {
        //
        NSURL *URL = [NSURL URLWithString:@"http://example.com/resources/123.json"];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        _request = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        _request.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

- (void)setCompletionBlockWithSuccess:(void (^)(UAHttpRequest *request, id responseObject))success
                              failure:(void (^)(UAHttpRequest *request, NSError *error))failure{
    
    __block UAHttpRequest *weakself = self;
       [_request setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        success(weakself,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        failure(weakself,error);
    }];

}

@end

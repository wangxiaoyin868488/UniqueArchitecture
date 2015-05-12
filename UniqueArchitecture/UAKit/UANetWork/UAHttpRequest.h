//
//  UAHttpRequest.h
//  UniqueArchitecture
//
//  Created by summer on 15/5/11.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPRequestOperation.h>
#import "UARequestModel.h"

@interface UAHttpRequest : NSObject{
}

@property (nonatomic,retain) AFHTTPRequestOperation *request;
@property (nonatomic,retain) UARequestModel *requestModel;

+ (UAHttpRequest *)requestWithModel:(UARequestModel *)model;

- (instancetype)initWithRequest:(UARequestModel *)model;

- (void)setCompletionBlockWithSuccess:(void (^)(UAHttpRequest *request, id responseObject))success
                              failure:(void (^)(UAHttpRequest *request, NSError *error))failure;
- (void)cancel;

@end

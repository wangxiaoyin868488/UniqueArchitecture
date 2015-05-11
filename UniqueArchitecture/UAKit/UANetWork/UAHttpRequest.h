//
//  UAHttpRequest.h
//  UniqueArchitecture
//
//  Created by summer on 15/5/11.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPRequestOperation.h>

@interface UAHttpRequest : NSObject{
}

@property (nonatomic,retain) AFHTTPRequestOperation *request;

+ (UAHttpRequest *)manager;

- (void)setCompletionBlockWithSuccess:(void (^)(UAHttpRequest *request, id responseObject))success
                              failure:(void (^)(UAHttpRequest *request, NSError *error))failure;
@end

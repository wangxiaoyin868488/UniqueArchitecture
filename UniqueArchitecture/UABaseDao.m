//
//  UABaseDao.m
//  UniqueArchitecture
//
//  Created by ccguo on 15/5/9.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "UABaseDao.h"
#import <FMDB/FMDB.h>

@interface UABaseDao(){
    FMDatabase *_db;
}

@end

static UABaseDao *shareInatance = nil;
@implementation UABaseDao
- (instancetype)shareInstance{
    @synchronized(self){
        if (shareInatance == nil) {
            shareInatance = [[UABaseDao alloc] init];
        }
    }
    return shareInatance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    @synchronized(self){
        if (shareInatance == nil) {
            shareInatance = [super allocWithZone:zone];
        }
    }
    return nil;
}

- (instancetype)copy{
    return shareInatance;
}

@end

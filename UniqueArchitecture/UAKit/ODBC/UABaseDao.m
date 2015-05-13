//
//  UABaseDao.m
//  UniqueArchitecture
//
//  Created by summer on 15/5/12.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "UABaseDao.h"
#import <FMDB/FMDB.h>
#import "UADB.h"

@interface UABaseDao(){
    FMDatabase *_db;
}

@end

@implementation UABaseDao

- (instancetype)init{
    self = [super init];
    
    if (self) {
        //
        _db = [[UADB shareInstance] getDB];
    }
    return self;
}

- (BOOL)insertWithDictionary:(NSDictionary *)params{
    return YES;
}

@end

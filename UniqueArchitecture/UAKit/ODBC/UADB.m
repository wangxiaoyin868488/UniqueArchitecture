//
//  UADBManager.m
//  UniqueArchitecture
//
//  Created by ccguo on 15/5/12.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "UADB.h"

#define DB_NAME @"db"

@interface UADB (){
    FMDatabaseQueue *_db;
}

@end

@implementation UADB
SYNTHESIZE_SINGLE_CLASS(UADB);

- (instancetype)init{
    self = [super init];
    
    if (self) {
        //
    }
    return self;
}

- (void) open{
//    BOOL success;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *DBPath = [documentDirectory stringByAppendingPathComponent:DB_NAME];
    
    if (_db == nil) {
        _db = [FMDatabaseQueue databaseQueueWithPath:DBPath];
        
//        if ([_db open]) {
//            [_db setShouldCacheStatements:YES];
//            DBGLog(@"Open success db !");
//        }else {
//            DBGLog(@"Failed to open db!");
//            success = NO;
//        }
    }
}

- (void) close{
    [_db close];
}

- (FMDatabaseQueue *) getDB{
    return _db;
}
@end

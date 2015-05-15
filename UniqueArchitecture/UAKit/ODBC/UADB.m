//
//  UADBManager.m
//  UniqueArchitecture
//
//  Created by ccguo on 15/5/12.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "UADB.h"

#define DB_NAME @"db.sqlite"

@interface UADB (){
    FMDatabaseQueue *_databaseQueue;
}

@end

@implementation UADB
SYNTHESIZE_SINGLE_CLASS(UADB);
//
//static UADB *shareInatance = nil;
//
//+ (instancetype)shareInstance{
//    @synchronized(self){
//        if (shareInatance == nil) {
//            shareInatance = [[UADB alloc] init];
//        }
//    }
//    return shareInatance;
//}
//
//+ (instancetype)allocWithZone:(struct _NSZone *)zone{
//    @synchronized(self){
//        if (shareInatance == nil) {
//            shareInatance = [super allocWithZone:zone];
//        }
//    }
//    return shareInatance;
//}
//
//- (instancetype)copy{
//    return shareInatance;
//}

- (instancetype)init{
    self = [super init];
    
    if (self) {
        //
        [self open];
    }
    return self;
}

- (void)open{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *DBPath = [documentDirectory stringByAppendingPathComponent:DB_NAME];
    DBGLog(@"%@",DBPath);
    if (_databaseQueue == nil) {
        _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:DBPath];
    }
}

- (void) close{
    [_databaseQueue close];
}

- (FMDatabaseQueue *) getDBQueue{
    return _databaseQueue;
}
@end

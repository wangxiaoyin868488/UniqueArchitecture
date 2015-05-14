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

@interface UABaseDao()

@end

@implementation UABaseDao

- (instancetype)init{
    self = [super init];
    
    if (self) {
        //
        _databasebQueue = [[UADB shareInstance] getDB];
    }
    return self;
}

- (void)insertWithSql:(NSString *)sql{
//    if (! [params count] > 0) {
//        return;
//    }
//    
//    NSMutableString *sql = [[NSMutableString alloc] initWithFormat:@"insert into %@(",self.tableName];
//    NSMutableString *param = [[NSMutableString alloc] initWithString:@"values("];
//    NSArray *keys = [params allKeys];
//    
//    for (NSString * key in keys) {
//        [sql appendFormat:@"%@,",key];
//        [param appendFormat:@"%@,",[params objectForKey:key]];
//    }
//    
//    [sql replaceCharactersInRange:NSMakeRange(sql.length-1, 1) withString:@")"];
//    [param replaceCharactersInRange:NSMakeRange(param.length-1, 1) withString:@")"];
//    [sql appendString:param];
    [_databasebQueue inTransaction:^(FMDatabase *db, BOOL *rollback){
        boo res = [db executeUpdate:sql,nil];
        if (! res) {
            DBGLog(@"%@ , %@",[db lastError],[db lastErrorMessage]);
        }
    }];
    
    return;
}

- (void)deleteWithSql:(NSString *)sql andDictionary:(NSDictionary *)params{
    [_databasebQueue inTransaction:^(FMDatabase *db, BOOL *rollback){
        BOOL res = [db executeUpdate:sql withParameterDictionary:params];
        if (!res) {
            DBGLog(@"%@ , %@",[db lastError],[db lastErrorMessage]);
        }
    }];
}

- (void)updateWithSql:(NSString *)sql withArgumentsInArray:(NSArray *)array{
    [_databasebQueue inTransaction:^(FMDatabase *db, BOOL *rollback){
        BOOL res = [db executeUpdate:sql withArgumentsInArray:array];
        if (! res) {
            DBGLog(@"%@ , %@",[db lastError],[db lastErrorMessage]);
        }
    }];
}

- (FMResultSet *)queryWithSql:(NSString *)sql{
    FMResultSet *sets = nil;
    [_databasebQueue inTransaction:^(FMDatabase *db, BOOL *rollback){
        sets = [db executeQuery:sql];
        if (![sets columnCount] > 0) {
             DBGLog(@"%@ , %@",[db lastError],[db lastErrorMessage]);
        }
    }];
    return sets;
}

- (void)checkTableAvaiableWithSql:(NSString *)sql{
    [_databasebQueue inTransaction:^(FMDatabase *db, BOOL *rollback){
        BOOL res = [db executeUpdate:sql];
        if (! res) {
            DBGLog(@"%@ , %@",[db lastError],[db lastErrorMessage]);
        }
    }];
}

@end

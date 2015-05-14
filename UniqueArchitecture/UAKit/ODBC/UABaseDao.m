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
    UADB *db1;
}

@end

@implementation UABaseDao

- (instancetype)init{
    self = [super init];
    
    if (self) {
        //
        db1 = [UADB shareInstance];
        [[UADB shareInstance] open];
        _db = [[UADB shareInstance] getDB];
    }
    return self;
}

- (void)insertWithDictionary:(NSDictionary *)params{
    if (! [params count] > 0) {
        return;
    }
    
    NSMutableString *sql = [[NSMutableString alloc] initWithFormat:@"insert into %@(",self.tableName];
    NSMutableString *param = [[NSMutableString alloc] initWithString:@"values("];
    NSArray *keys = [params allKeys];
    
    for (NSString * key in keys) {
        [sql appendFormat:@"%@,",key];
        [param appendFormat:@"%@,",[params objectForKey:key]];
    }
    
    [sql replaceCharactersInRange:NSMakeRange(sql.length-1, 1) withString:@")"];
    [param replaceCharactersInRange:NSMakeRange(param.length-1, 1) withString:@")"];
    [sql appendString:param];
    [_db inTransaction:^(FMDatabase *db, BOOL *rollback){
        [db executeUpdate:sql,nil];
        if ([db hadError]) {
            DBGLog(@"%@ , %@",[db lastError],[db lastErrorMessage]);
        }
    }];
    
    return;
}

- (void)deleteWithSql:(NSString *)sql andDictionary:(NSDictionary *)params{
    if (sql) {
        if ([params count] > 0) {
            [_db inTransaction:^(FMDatabase *db, BOOL *rollback){
                [db executeUpdate:sql withParameterDictionary:params];
                if ([db hadError]) {
                    DBGLog(@"%@ , %@",[db lastError],[db lastErrorMessage]);
                }
            }];
        }else{
            [_db inTransaction:^(FMDatabase *db, BOOL *rollback){
                [db executeUpdate:sql withParameterDictionary:params];
                if ([db hadError]) {
                    DBGLog(@"%@ , %@",[db lastError],[db lastErrorMessage]);
                }
            }];
        }
    }
}

- (void)updateWithSql:(NSString *)sql andDictionary:(NSDictionary *)params{
    if (sql) {
        if ([params count] > 0) {
            [_db inTransaction:^(FMDatabase *db, BOOL *rollback){
                [db executeUpdate:sql withParameterDictionary:params];
                if ([db hadError]) {
                    DBGLog(@"%@ , %@",[db lastError],[db lastErrorMessage]);
                }
            }];
        }else{
            [_db inTransaction:^(FMDatabase *db, BOOL *rollback){
                [db executeUpdate:sql withParameterDictionary:params];
                if ([db hadError]) {
                    DBGLog(@"%@ , %@",[db lastError],[db lastErrorMessage]);
                }
            }];
        }
    }
}

- (NSArray *)queryWithSql:(NSString *)sql{
//    FMResultSet *sets = nil;
    if (sql) {
//        sets = [_db executeQuery:sql];
    }
    NSArray *array;
    return array;
}

@end

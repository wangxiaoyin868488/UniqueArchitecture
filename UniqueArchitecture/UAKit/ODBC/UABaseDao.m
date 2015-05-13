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
    if (! [params count] > 0) {
        return NO;
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
    [_db executeUpdate:sql withParameterDictionary:params];
    if ([_db hadError]) {
        NSLog(@"%@ , %@",[_db lastError],[_db lastErrorMessage]);
        return NO;
    }
    return YES;
}

- (BOOL)deleteWithSql:(NSString *)sql andDictionary:(NSDictionary *)params{
    if (sql) {
        if ([params count] > 0) {
            [_db executeUpdate:sql withParameterDictionary:params];
        }else{
            [_db executeUpdate:sql];
        }
        if ([_db hadError]) {
            NSLog(@"%@ , %@",[_db lastError],[_db lastErrorMessage]);
            return NO;
        }
        return YES;
    }
    return NO;
}

- (BOOL)updateWithSql:(NSString *)sql andDictionary:(NSDictionary *)params{
    if (sql) {
        if ([params count] > 0) {
            [_db executeUpdate:sql withParameterDictionary:params];
        }else{
            [_db executeUpdate:sql];
        }
        if ([_db hadError]) {
            NSLog(@"%@ , %@",[_db lastError],[_db lastErrorMessage]);
            return NO;
        }
        return YES;
    }
    return NO;
}

- (NSArray *)queryWithSql:(NSString *)sql{
    if (sql) {
        
    }
}

@end

//
//  HomeDao.m
//  UniqueArchitecture
//
//  Created by summer on 15/5/14.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "HomeDao.h"

@implementation HomeDao

- (instancetype)init{
    self = [super init];
    
    if (self) {
        //
        self.tableName = HOME_TABLE_NAME;
        [self checkTable];
    }
    return self;
}

/*/*SELECT COUNT(*) FROM sqlite_master where type='table' and name='PackDaoTable';*/

- (void)checkTable{
    NSString *createTable = [NSString stringWithFormat:@"CREATE TABLE if not exists %@ ('id' INTEGER PRIMARY KEY  NOT NULL ,'name' TEXT,'sid' TEXT)", self.tableName];
    [self.db inDatabase:^(FMDatabase *db){
        BOOL res = [db executeUpdate:createTable];
        if (!res){
            DBGLog(@"%@ , %@",[db lastError],[db lastErrorMessage]);
        }
    }];    
}

@end

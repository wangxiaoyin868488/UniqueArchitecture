//
//  UABaseDao.h
//  UniqueArchitecture
//
//  Created by summer on 15/5/12.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UABaseDao : NSObject{
    
}

@property (nonatomic,retain) NSString         *tableName;
@property (nonatomic,retain) FMDatabaseQueue  *db;

/**
 *  插入操作
 *
 *  @param params 参数
 *
 *  @return bool
 */
- (void)insertWithDictionary:(NSDictionary *)params;

/**
 *  删除数据
 *
 *  @param sql    sql语句
 *  @param params 参数
 *
 *  @return bool
 */
- (void)deleteWithSql:(NSString *)sql andDictionary:(NSDictionary *)params;

/**
 *  更新
 *
 *  @param sql    sql语句
 *  @param params 参数
 *
 *  @return bool
 */
- (void)updateWithSql:(NSString *)sql andDictionary:(NSDictionary *)params;

/**
 *  查询
 *
 *  @param sql sql语句
 *
 *  @return bool
 */
- (NSArray *)queryWithSql:(NSString *)sql;

@end

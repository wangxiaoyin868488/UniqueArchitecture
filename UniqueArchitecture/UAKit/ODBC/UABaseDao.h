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

@property (nonatomic,retain)NSString *tableName;

/**
 *  插入操作
 *
 *  @param params 参数
 *
 *  @return bool
 */
- (BOOL)insertWithDictionary:(NSDictionary *)params;

/**
 *  删除数据
 *
 *  @param sql    sql语句
 *  @param params 参数
 *
 *  @return bool
 */
- (BOOL)deleteWithSql:(NSString *)sql andDictionary:(NSDictionary *)params;

/**
 *  更新
 *
 *  @param sql    sql语句
 *  @param params 参数
 *
 *  @return bool
 */
- (BOOL)updateWithSql:(NSString *)sql andDictionary:(NSDictionary *)params;

/**
 *  查询
 *
 *  @param sql sql语句
 *
 *  @return bool
 */
- (BOOL)queryWithSql:(NSString *)sql;

@end

//
//  UADBManager.h
//  UniqueArchitecture
//
//  Created by ccguo on 15/5/12.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

@interface UADB : NSObject

/*!
 *  创建数据库
 *
 *  @return 实例对象
 */
//- (instancetype)shareInstance;


/*!
 *  打开数据库
 *
 *  @since 3.6.1
 */
- (void) open;


/*!
 *  关闭数据库
 *
 *  @since 3.6.1
 */
- (void) close;



/*!
 *  获取FMDatabase
 *
 *  @return FMDatabase
 *
 *  @since 3.6.1
 */
- (FMDatabase *) getDB;


@end

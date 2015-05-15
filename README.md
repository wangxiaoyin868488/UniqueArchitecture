# UniqueArchitecture
通用框架 v 1.0

iOS 快速搭建开发框架


## UniqueArchitecture
###UAKit
* ODBC db操作组件
* UABase  VC的重构
* UANetWork 针对AF进一步使用的封装


####  ODBC组件介绍使用
* UADB DB的一个单例，主要用于对数据库文件的管理
* UABaseDao  dao层几类，使用时间继承基类，基类里面主要是增、删、改、查对应的操作

备注: ODBC模块的目前主要采用Transaction进行操作，支持多线程并发

```objc
#define HOME_TABLE_NAME @"newsTable"

@interface HomeDao : UABaseDao

//dao层基本四像素操作 model : insert updata delete

/**
 *  插入news
 *
 *  @param news 实例对象
 *
 *  return void
 */
- (void)insertWithNews:(News *)news;

```

```objc
@implementation HomeDao

- (instancetype)init{
    self = [super init];
    
    if (self) {
        //
        self.tableName = HOME_TABLE_NAME;
        self.modelName = @"News";
        [self checkTable];
    }
    return self;
}

/*/*SELECT COUNT(*) FROM sqlite_master where type='table' and name='PackDaoTable';*/

- (void)checkTable{
    NSString *createTable = [NSString stringWithFormat:@"CREATE TABLE if not exists %@ ('id' INTEGER PRIMARY KEY  NOT NULL ,'name' TEXT,'sid' TEXT)", self.tableName];
    [self checkTableAvaiableWithSql:createTable];
}

- (void)insertWithNews:(News *)news{
    NSString *sql = [NSString stringWithFormat:@"insert into %@(name,sid)vaues(%@,%@)",self.tableName,news.city,news.time];
    [self insertWithSql:sql];
}

- (void)updateWithNews:(News *)news andID:(NSString *)Id{
    NSString *sql = [NSString stringWithFormat:@"update %@ set name=%@,sid=%@ where id=%d",self.tableName,news.city,news.time,[Id intValue]];
    [self updateWithSql:sql withArgumentsInArray:nil];
}

- (void)deleteNewsWithId:(NSString *)Id{
    NSString *sql = [NSString stringWithFormat:@"delete from %@ where id=%d",self.tableName,[Id intValue]];
    [self deleteWithSql:sql andDictionary:nil];
}

```

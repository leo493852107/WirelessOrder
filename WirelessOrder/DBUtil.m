//
//  DBUtil.m
//  WirelessOrder
//
//  Created by leo on 15/9/14.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import "DBUtil.h"

@implementation DBUtil

/**
 *  静态实例实现单例设计模式
 */
static DBUtil *instance = nil;
 
/**
 *  返回当前实例
 */
+ (DBUtil *)getInstance{
    if (!instance) {
        instance = [[DBUtil alloc]init];
    }
    return instance;
}

/**
 *  初始化
 */
- (instancetype)init{
    self = [super init];
    if (self) {
        NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [docPaths objectAtIndex:0];
        
//        NSLog(@"db path = %@",path);
        //创建数据库路径
        self.path = [path stringByAppendingPathComponent:@"wireless.db"];
        
        self.db = [FMDatabase databaseWithPath:self.path];
        
        //创建表
        [self open];
        [self createTable];
        [self close];

    }
    return self;
}

//打开数据库
- (void)open{
    if (![self.db open]) {
        return;
    }
}

//关闭数据库
- (void)close{
    [self.db close];
}

- (void)createTable{
    
    NSString *sql = @"create table if not exists MenuTbl(objectid text,name text,price real,tid text,pic_path text,description text)";
    
    NSString *sql2 = @"create table if not exists MenuTypeTbl(objectid text,name text)";
    
    [self.db executeUpdate:sql];
    [self.db executeUpdate:sql2];
}

//添加之前先删除
- (void)deleteAllMenuType{
    [self open];
    NSString *sql = @"delete from MenuTypeTbl";
    [self.db executeUpdate:sql];
    [self close];
}

- (void)addMenuType:(MenuType *)mt{
    [self open];
    NSString *sql = @"insert into MenuTypeTbl(objectid,name)values(?,?)";
    BOOL flag = [self.db executeUpdate:sql,mt.objectid,mt.name];
    if (flag) {
        NSLog(@"添加成功!");
    } else{
        NSLog(@"添加失败!");
    }
    [self close];
}

//添加之前先删除
- (void)deleteAllMenu{
    [self open];
    NSString *sql = @"delete from MenuTbl";
    [self.db executeUpdate:sql];
    [self close];
}

//添加菜单
- (void)addMenu:(Menu *)m{
    
    [self open];
    NSString *sql = @"insert into MenuTbl(objectid,name,price,tid,pic_path,description)values(?,?,?,?,?,?)";
    
    [self.db executeUpdate:sql,m.objectid,m.name,[NSNumber numberWithFloat:m.price],m.tid,m.picture_path,m.desc];
    
    [self close];
}

// 查询Menu
- (NSMutableArray *)queryMenu{
    
    [self open];
    FMResultSet *set = [self.db executeQuery:@"SELECT * FROM MenuTbl"];
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:10];
    
    while ([set next]) {
        NSString *objectid = [set stringForColumn:@"objectid"];
        NSString *name = [set stringForColumn:@"name"];
        float price = [set doubleForColumn:@"price"];
        NSString *tid = [set stringForColumn:@"tid"];
        NSString *pic_path = [set stringForColumn:@"pic_path"];
        
        NSString *description = [set stringForColumn:@"description"];
        
        Menu *m =[[Menu alloc]init];
        m.objectid = objectid;
        m.name = name;
        m.price = price;
        m.tid = tid;
        m.picture_path = pic_path;
        m.desc = description;
        [tmp addObject:m];
    }
    [self close];
    return tmp;
    
}


//根据tid查询
- (NSMutableArray *)queryMenuById:(NSString *)tid{
    [self open];
    FMResultSet *set = [self.db executeQuery:@"SELECT * FROM MenuTbl WHERE tid = ?",tid];
    
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:10];
    
    while ([set next]) {
        NSString *objectid = [set stringForColumn:@"objectid"];
        NSString *name = [set stringForColumn:@"name"];
        float price = [set doubleForColumn:@"price"];
        NSString *tid = [set stringForColumn:@"tid"];
        NSString *pic_path = [set stringForColumn:@"pic_path"];
        
        NSString *description = [set stringForColumn:@"description"];
        
        Menu *m =[[Menu alloc]init];
        m.objectid = objectid;
        m.name = name;
        m.price = price;
        m.tid = tid;
        m.picture_path = pic_path;
        m.desc = description;
        [tmp addObject:m];
    }
    [self close];
    return tmp;
}

//查询MenuType
- (NSMutableArray *)queryMenuType{
    [self open];
    FMResultSet *set = [self.db executeQuery:@"SELECT * FROM MenuTypeTbl"];
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:10];
    while ([set next]) {
        NSString *objectid = [set stringForColumn:@"objectid"];
        NSString *name = [set stringForColumn:@"name"];
        Menu *m = [[Menu alloc]init];
        m.objectid = objectid;
        m.name = name;
        [tmp addObject:m];
    }
    [self close];
    return tmp;
    
}


@end

//
//  DBUtil.h
//  WirelessOrder
//
//  Created by leo on 15/9/14.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FMDatabaseQueue.h"
#import "FMDatabase.h"
#import "Menu.h"
#import "MenuType.h"

@interface DBUtil : NSObject

/**
 *  数据库保存路径
 */
@property (nonatomic, strong) NSString *path;

/**
 *  数据库实例
 */
@property (nonatomic, strong) FMDatabase *db;


/**
 *  单例设计模式
 */
+ (DBUtil *)getInstance;

/**
 *  打开数据库
 */
- (void)open;

/**
 *  关闭数据库
 */
- (void)close;

/**
 *  创建表
 */
- (void)createTable;

/**
 *  添加菜单
 */
- (void)addMenu:(Menu *)m;

/**
 *  删除所有菜单
 */
- (void)deleteAllMenu;

/**
 *  添加菜单分类
 */
- (void)addMenuType:(MenuType *)mt;

/**
 *  删除所有菜单分类
 */
- (void)deleteAllMenuType;


/**
 *  查询Menu
 */
- (NSMutableArray *)queryMenu;

/**
 *  根据tid查询
 */
- (NSMutableArray *)queryMenuById:(NSString *)tid;

/**
 *  查询MenuType
 */
- (NSMutableArray *)queryMenuType;

@end

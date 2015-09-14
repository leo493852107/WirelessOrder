//
//  MenuManager.m
//  WirelessOrder
//
//  Created by leo on 15/9/14.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import "MenuManager.h"
#import <BmobSDK/Bmob.h>

#import "MenuType.h"
#import "Menu.h"

#import "AFNetworking.h"

@implementation MenuManager

- (instancetype)init{
    self = [super init];
    if (self) {
        self.util = [DBUtil getInstance];
        return self;
    }
    return nil;
}

//1 同步菜单
- (void)syncMenu{
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"MenuTbl"];
    //查找GameScore表的数据
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {
            //打印playerName
            NSLog(@"Name = %@", [obj objectForKey:@"name"]);
            BmobFile *file = [obj objectForKey:@"picture"];
            NSString *url = file.url;
            
            [self download:url];
            //打印objectId,createdAt,updatedAt
            NSLog(@"url = %@", url);
        }
    }];

}

- (void)download:(NSString *)url {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
}


//2 同步菜单分类
- (void)syncMenuType{
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"MenuTypeTbl"];
    //查找GameScore表的数据
    
    [self.util deleteAllMenuType];
    
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {
            
            NSString *objectid = [obj objectId];
            NSString *name = [obj objectForKey:@"name"];
            
            MenuType *mt = [[MenuType alloc]init];
            mt.objectid = objectid;
            mt.name = name;
            
            
            [self.util addMenuType:mt];
            
        }
    }];
}

@end

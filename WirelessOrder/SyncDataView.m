//
//  SyncDataView.m
//  WirelessOrder
//
//  Created by leo on 15/9/13.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import "SyncDataView.h"

@implementation SyncDataView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //init...
//        self.backgroundColor = [UIColor brownColor];
        self.datasource = @[@"同步菜单分类",@"同步菜单"];
        self.tv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        self.tv.dataSource = self;
        self.tv.delegate = self;
        
        [self addSubview:self.tv];
        self.menuManager = [[MenuManager alloc]init];
        return self;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您是否真的要同步数据" delegate:self cancelButtonTitle:@"是" otherButtonTitles:@"否", nil];
            alert.tag = 1;
            [alert show];
        }
            break;
            
        case 1:
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您是否真的要同步数据" delegate:self cancelButtonTitle:@"是" otherButtonTitles:@"否", nil];
            alert.tag = 2;
            [alert show];
        }
            break;
            
        default:
            break;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (alertView.tag) {
        case 1:
            if (buttonIndex == 0) {
                //同步
                NSLog(@"同步分类");
                [self.menuManager syncMenuType];
            }
            break;
            
        case 2:
            if (buttonIndex == 0) {
                //同步
                NSLog(@"同步菜单");
            }
            break;
            
        default:
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    cell.textLabel.text = [self.datasource objectAtIndex:indexPath.row];
    
    return cell;
}

@end

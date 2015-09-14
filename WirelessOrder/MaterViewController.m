//
//  MaterViewController.m
//  WirelessOrder
//
//  Created by leo on 15/9/13.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import "MaterViewController.h"
#import "Constant.h"
#import "MenuManager.h"

@interface MaterViewController ()

@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) UITableView *tv;
@property (nonatomic, strong) MenuManager *muneManager;

@end

@implementation MaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    self.tv = [[UITableView alloc]initWithFrame:CGRectMake(0, 5, MAX_WIDTH, self.view.frame.size.height)];
    
    [self initDatasource];
    
    self.tv.dataSource = self;
    self.tv.delegate = self;
    
    [self.view addSubview:self.tv];
    
    // 初始化视图
    [self initViews];
    
    self.muneManager = [[MenuManager alloc]init];
//    [self.muneManager syncMenu];
    
    
}

- (void)initViews{
    self.menuView = [[MenuView alloc]initWithFrame:self.view.frame];
    self.tableView = [[TableView alloc]initWithFrame:self.view.frame];
    self.payView = [[PayView alloc]initWithFrame:self.view.frame];
    self.syncDataView = [[SyncDataView alloc]initWithFrame:self.view.frame];
    self.settingView = [[SettingView alloc]initWithFrame:self.view.frame];
    
}

- (void)initDatasource{
    self.datasource = [NSMutableArray arrayWithCapacity:5];
    [self.datasource addObject:@"浏览餐单"];
    [self.datasource addObject:@"查看餐台"];
    [self.datasource addObject:@"买单结算"];
    [self.datasource addObject:@"同步数据"];
    [self.datasource addObject:@"系统设置"];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            NSLog(@"浏览餐单");
            self.detail.view = self.menuView;
            break;
            
        case 1:
            NSLog(@"查看餐台");
            self.detail.view = self.tableView;
            break;
            
        case 2:
            NSLog(@"买单结算");
            self.detail.view = self.payView;
            break;
            
        case 3:
//            [self.muneManager syncMenuType];
            NSLog(@"同步数据");
            self.detail.view = self.syncDataView;
            break;
            
        case 4:
            NSLog(@"系统设置");
            self.detail.view = self.settingView;
            break;
            
        default:
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseId = @"cid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
    NSString *item = [self.datasource objectAtIndex:indexPath.row];
    cell.textLabel.text = item;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

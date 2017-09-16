//
//  ZYBaseTableViewController.m
//  YourEye
//
//  Created by DevKK on 2017/9/12.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "ZYBaseTableViewController.h"

@interface ZYBaseTableViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ZYBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[
                       @"占位1",
                       @"占位2",
                       @"占位3",
                       @"占位4",
                       @"占位5",
                       ];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

@end

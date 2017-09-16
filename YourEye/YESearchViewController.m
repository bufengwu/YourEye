//
//  YESearchViewController.m
//  YourEye
//
//  Created by DevKK on 2017/9/8.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "YESearchViewController.h"

@interface YESearchViewController () <UISearchBarDelegate>

@property (nonatomic, strong) NSArray *searchResultArray;

@end

@implementation YESearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    self.navigationItem.titleView = searchBar;
    searchBar.showsCancelButton = YES;
    [searchBar setValue:@"取消" forKey:@"_cancelButtonText"];
    [searchBar becomeFirstResponder];
    
    searchBar.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.searchResultArray = @[@"1", @"2", @"3"];
    [self.tableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResultArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = self.searchResultArray[indexPath.row];
    
    return cell;
}

@end

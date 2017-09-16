//
//  YEPageVC.m
//  MafiaTw
//
//  Created by DevKK on 2017/9/8.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "YEPageVC.h"

@interface YEPageVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *tableArray1;
@property (nonatomic, strong) NSArray *tableArray2;

@end

@implementation YEPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableArray1 = @[
                         @"1",
                         @"34",
                         @"ersd",
                         @"236",
                         @"sd",
                         @"v232",
                         ];
    self.tableArray2 = @[
                         @"jjhk",
                         @"sertd",
                         @"23432",
                         @"zf23r",
                         @"5645gfd",
                         @"sd",
                         ];
    
    self.view.frame = [[UIScreen mainScreen] bounds];
    self.scrollView.pagingEnabled = YES;
    
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    
    self.scrollView.delegate = self;
    
}

- (IBAction)clickButton:(UIButton *)sender {
    if ([sender isEqual:self.button1]) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(self.tableView1.bounds.size.width, 0) animated:YES];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if (tableView == self.tableView1) {
        
        cell.textLabel.text = self.tableArray1[indexPath.row];
    } else {
        
        cell.textLabel.text = self.tableArray2[indexPath.row];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.tableView1) {
        return self.tableArray1.count;
    } else {
        return self.tableArray2.count;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == self.scrollView) {
        
        if (scrollView.contentOffset.x == self.view.bounds.size.width) {
            [UIView animateWithDuration:0.3 animations:^{
                self.bannerView.center = CGPointMake(self.button2.center.x, self.bannerView.center.y);
            }];
        } else {
            [UIView animateWithDuration:0.3 animations:^{
                self.bannerView.center = CGPointMake(self.button1.center.x, self.bannerView.center.y);
            }];
        }
        
    }

}

@end

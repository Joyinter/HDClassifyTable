//
//  HDClassifyTableViewController.m
//  HDClassifyTable
//
//  Created by Delano on 2017/2/10.
//  Copyright © 2017年 delano. All rights reserved.
//

#import "HDClassifyTableViewController.h"
#import "HDClassifyTableViewDatasource.h"
#import "HDClassifyLeftTableViewModel.h"
#import "HDClassifyRightTableViewModel.h"

@interface HDClassifyTableViewController ()

@property (nonatomic, strong) HDClassifyLeftTableViewModel *leftTableViewModel;
@property (nonatomic, strong) HDClassifyRightTableViewModel *rightTableViewModel;
@property (nonatomic, strong) HDClassifyTableViewDatasource *dataSource;

@end

@implementation HDClassifyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark - Getters and Setters
- (HDClassifyLeftTableViewModel *)leftTableViewModel
{
    if (_leftTableViewModel == nil) {
        _leftTableViewModel = [[HDClassifyLeftTableViewModel alloc] init];
    }
    return _leftTableViewModel;
}

- (HDClassifyRightTableViewModel *)rightTableViewModel
{
    if (_rightTableViewModel == nil) {
        _rightTableViewModel = [[HDClassifyRightTableViewModel alloc] init];
    }
    return _rightTableViewModel;
}

- (HDClassifyTableViewDatasource *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [[HDClassifyTableViewDatasource alloc] init];
    }
    return _dataSource;
}

@end

//
//  HDClassifyTableViewController.m
//  HDClassifyTable
//
//  Created by Joyinter on 2017/2/10.
//  Copyright © 2017年 Joyinter. All rights reserved.
//

#import "HDClassifyTableViewController.h"
#import "HDClassifyTableViewDatasource.h"
#import "HDClassifyLeftTableViewModel.h"
#import "HDClassifyRightTableViewModel.h"
#import <HandyFrame/UIView+LayoutMethods.h>

@interface HDClassifyTableViewController ()<HDClassifyLeftTableViewModelDelegate,HDClassifyRightTableViewModelDelegate>

@property (nonatomic, strong) HDClassifyLeftTableViewModel *leftTableViewModel;
@property (nonatomic, strong) HDClassifyRightTableViewModel *rightTableViewModel;
@property (nonatomic, strong) HDClassifyTableViewDatasource *dataSource;

@end

@implementation HDClassifyTableViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.leftTableViewModel.tableView];
    [self.view addSubview:self.rightTableViewModel.tableView];    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self.leftTableViewModel.tableView topInContainer:64 shouldResize:NO];
    self.leftTableViewModel.tableView.width = 99;
    [self.leftTableViewModel.tableView leftInContainer:0 shouldResize:NO];
    [self.leftTableViewModel.tableView bottomInContainer:0 shouldResize:YES];
    
    [self.rightTableViewModel.tableView fill];
    [self.rightTableViewModel.tableView topEqualToView:self.leftTableViewModel.tableView];
    [self.rightTableViewModel.tableView leftInContainer:99 shouldResize:YES];
    [self.rightTableViewModel.tableView bottomInContainer:0 shouldResize:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.leftTableViewModel scrollToSelectedSection];
}

#pragma mark - HDClassifyLeftTableViewModelDelegate
- (void)classifyLeftTableViewModel:(HDClassifyLeftTableViewModel *)viewModel didSelectedAtIndexPath:(NSIndexPath *)indexPath
{
    [self.rightTableViewModel scrollToIndexPathFromLeft:indexPath];
}

#pragma mark - HDClassifyRightTableViewModelDelegate
- (void)rightViewModel:(HDClassifyRightTableViewModel *)viewModel didScrollToIndexPath:(NSIndexPath *)indexPath
{
    [self.leftTableViewModel selectAtIndexPathFromRight:indexPath];
}

#pragma mark - Getters and Setters
- (HDClassifyLeftTableViewModel *)leftTableViewModel
{
    if (_leftTableViewModel == nil) {
        _leftTableViewModel = [[HDClassifyLeftTableViewModel alloc] init];
        _leftTableViewModel.delegate = self;
        _leftTableViewModel.dataSource = self.dataSource;
    }
    return _leftTableViewModel;
}

- (HDClassifyRightTableViewModel *)rightTableViewModel
{
    if (_rightTableViewModel == nil) {
        _rightTableViewModel = [[HDClassifyRightTableViewModel alloc] init];
        _rightTableViewModel.delegate = self;
        _rightTableViewModel.dataSource = self.dataSource;
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

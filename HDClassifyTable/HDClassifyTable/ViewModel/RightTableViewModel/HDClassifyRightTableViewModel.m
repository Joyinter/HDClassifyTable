//
//  HDClassifyRightTableViewModel.m
//  HDClassifyTable
//
//  Created by Delano on 2017/2/10.
//  Copyright © 2017年 delano. All rights reserved.
//

#import "HDClassifyRightTableViewModel.h"
#import "HDRightTableViewCell.h"

extern NSString * const kHDClassifyLeftTableViewModelDataKeyChildNode;

@interface HDClassifyRightTableViewModel ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong) NSArray *contentData;
@property (nonatomic, assign) NSUInteger currentSelectedSection;
@property (nonatomic, assign) BOOL isRequestedFromLeft;
@property (nonatomic, strong) NSIndexPath *indexPathFromLeft;

@end

@implementation HDClassifyRightTableViewModel

#pragma mark - public methods
- (void)scrollToIndexPathFromLeft:(NSIndexPath *)indexPathFromLeft
{
    self.isRequestedFromLeft = YES;
    self.currentSelectedSection = 0;
    self.indexPathFromLeft = indexPathFromLeft;
    for (int i = 0; i < self.dataSource.dataSource.count; i++) {
        if (i == indexPathFromLeft.section) {
            self.currentSelectedSection += indexPathFromLeft.row;
            break;
        } else {
            self.currentSelectedSection += [self.dataSource.dataSource[i][kHDClassifyLeftTableViewModelDataKeyChildNode] count];
        }
    }
    if ([self.contentData count] == 0) {
        return;
    }
    if ([self.contentData[self.currentSelectedSection][kHDClassifyLeftTableViewModelDataKeyChildNode] count] > 0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.currentSelectedSection] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }else{
        //网络请求
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger result;
    result = self.contentData.count;
    return result;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger result = 0;
    result = [self.contentData[section][kHDClassifyLeftTableViewModelDataKeyChildNode] count];
    return result;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat result = 0;
    return result;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 117;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HDRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kHDRightTableViewCellIdentifier];
    cell.textLabel.text = self.contentData[indexPath.section][kHDClassifyLeftTableViewModelDataKeyChildNode][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.currentSelectedSection != self.tableView.indexPathsForVisibleRows.firstObject.section) {
        NSInteger row = self.tableView.indexPathsForVisibleRows.firstObject.row;
        NSInteger section = self.tableView.indexPathsForVisibleRows.firstObject.section;
        self.currentSelectedSection = section;
        if (self.isRequestedFromLeft == NO) {
            if ([self.delegate respondsToSelector:@selector(rightViewModel:didScrollToIndexPath:)]) {
                [self.delegate rightViewModel:self
                         didScrollToIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
            }
        }
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    self.isRequestedFromLeft = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.isRequestedFromLeft = NO;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.isRequestedFromLeft = NO;
}

#pragma mark - getters and setters
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[HDRightTableViewCell class] forCellReuseIdentifier:kHDRightTableViewCellIdentifier];
    }
    return _tableView;
}

- (NSArray *)contentData
{
    _contentData = [self.dataSource dataListForRightTable];
    return _contentData;
}

@end

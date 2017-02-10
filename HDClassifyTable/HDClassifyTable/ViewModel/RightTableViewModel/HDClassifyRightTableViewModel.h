//
//  HDClassifyRightTableViewModel.h
//  HDClassifyTable
//
//  Created by Delano on 2017/2/10.
//  Copyright © 2017年 delano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDClassifyTableViewDatasource+right.h"

@protocol HDClassifyRightTableViewModelDelegate;

@interface HDClassifyRightTableViewModel : NSObject

@property (nonatomic, strong, readonly) UITableView *tableView;
@property (nonatomic, strong) HDClassifyTableViewDatasource *dataSource;
@property (nonatomic, weak) id <HDClassifyRightTableViewModelDelegate> delegate;

- (void)scrollToIndexPathFromLeft:(NSIndexPath *)indexPathFromLeft;

@end

@protocol HDClassifyRightTableViewModelDelegate <NSObject>

- (void)rightViewModel:(HDClassifyRightTableViewModel *)viewModel didScrollToIndexPath:(NSIndexPath *)indexPath;

@end

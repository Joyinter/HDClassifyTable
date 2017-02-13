//
//  HDClassifyLeftTableViewModel.h
//  HDClassifyTable
//
//  Created by Joyinter on 2017/2/10.
//  Copyright © 2017年 Joyinter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDClassifyTableViewDatasource+left.h"

extern NSString * const kHDClassifyLeftTableViewModelSelected;
extern NSString * const kHDClassifyLeftTableViewModelDataKeyName;
extern NSString * const kHDClassifyLeftTableViewModelDataKeyChildNode;

@protocol HDClassifyLeftTableViewModelDelegate;

@interface HDClassifyLeftTableViewModel : NSObject

@property (nonatomic, strong) HDClassifyTableViewDatasource *dataSource;
@property (nonatomic, weak) id <HDClassifyLeftTableViewModelDelegate> delegate;

@property (nonatomic, strong, readonly) UITableView *tableView;

- (void)selectAtIndexPathFromRight:(NSIndexPath *)indexPathRight;
- (void)scrollToSelectedSection;

@end

@protocol HDClassifyLeftTableViewModelDelegate <NSObject>

- (void)classifyLeftTableViewModel:(HDClassifyLeftTableViewModel *)viewModel didSelectedAtIndexPath:(NSIndexPath *)indexPath;

@end

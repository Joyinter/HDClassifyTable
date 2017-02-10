//
//  HDClassifyTableViewDatasource.h
//  HDClassifyTable
//
//  Created by Delano on 2017/2/10.
//  Copyright © 2017年 delano. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HDClassifyTableViewDatasourceDelegate;

@interface HDClassifyTableViewDatasource : NSObject

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, weak) id <HDClassifyTableViewDatasourceDelegate> delegate;
@end

@protocol HDClassifyTableViewDatasourceDelegate <NSObject>

- (void)classifyListDataSourceDidFinishedUpdateLeftData:(HDClassifyTableViewDatasource *)dataSource;
- (void)classifyListDataSourceDidFinishedUpdateRightData:(HDClassifyTableViewDatasource *)dataSource withIndexPath:(NSIndexPath *)indexPath;

@end

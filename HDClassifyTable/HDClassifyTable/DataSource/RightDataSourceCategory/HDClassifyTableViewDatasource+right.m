//
//  HDClassifyTableViewDatasource+right.m
//  HDClassifyTable
//
//  Created by Joyinter on 2017/2/10.
//  Copyright © 2017年 Joyinter. All rights reserved.
//

#import "HDClassifyTableViewDatasource+right.h"

extern NSString * const kHDClassifyLeftTableViewModelDataKeyChildNode;
@implementation HDClassifyTableViewDatasource (right)

- (NSArray *)dataListForRightTable
{
    NSArray *dataSource = [NSArray array];
    for (int i = 0; i < self.dataSource.count; i++) {
        dataSource = [dataSource arrayByAddingObjectsFromArray:self.dataSource[i][kHDClassifyLeftTableViewModelDataKeyChildNode]];
    }
    return dataSource;
}
@end

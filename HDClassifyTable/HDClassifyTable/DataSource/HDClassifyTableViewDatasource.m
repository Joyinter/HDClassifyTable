//
//  HDClassifyTableViewDatasource.m
//  HDClassifyTable
//
//  Created by Joyinter on 2017/2/10.
//  Copyright © 2017年 Joyinter. All rights reserved.
//

#import "HDClassifyTableViewDatasource.h"
#import "HDClassifyLeftTableViewModel.h"

@implementation HDClassifyTableViewDatasource

#pragma mark - getters and setters
- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSArray array];
        _dataSource = @[
                            @{
            kHDClassifyLeftTableViewModelSelected:@NO,
            kHDClassifyLeftTableViewModelDataKeyName:@"第一组",
            kHDClassifyLeftTableViewModelDataKeyChildNode:@[
                                                    @{
                                                        kHDClassifyLeftTableViewModelDataKeyName:@"第1元素",
                                                        kHDClassifyLeftTableViewModelDataKeyChildNode:@[
                                                                @"第一组第一元素1",
                                                                @"第一组第一元素2",
                                                                @"第一组第一元素3",
                                                                @"第一组第一元素4",
                                                                @"第一组第一元素5",
                                                                @"第一组第一元素6",
                                                  
                                                                ]
                                                        },
                                                    @{
                                                        kHDClassifyLeftTableViewModelDataKeyName:@"第2元素",
                                                        kHDClassifyLeftTableViewModelDataKeyChildNode:@[
                                                                @"第一组第二元素1",
                                                                @"第一组第二元素2",
                                                                @"第一组第二元素3",
                                                                @"第一组第二元素4",
                                                                @"第一组第二元素5",
                                                                @"第一组第二元素6",
                                                                @"第一组第二元素7",
                                                                                                                ]
                                                        }
                                                    ]
                                            }.mutableCopy,
                                        @{kHDClassifyLeftTableViewModelSelected:@YES,
                                          kHDClassifyLeftTableViewModelDataKeyName:@"第二组",
                                          kHDClassifyLeftTableViewModelDataKeyChildNode:@[
                                                  @{
                                                      kHDClassifyLeftTableViewModelDataKeyName:@"第1元素",
                                                      kHDClassifyLeftTableViewModelDataKeyChildNode:@[
                                                              @"第二组第一元素1",
                                                              @"第二组第一元素2",
                                                              @"第二组第一元素3",
                                                              @"第二组第一元素4",
                                                              @"第二组第一元素5",
                                                              @"第二组第一元素6",
                                                              @"第二组第一元素7",
                                                              @"第二组第一元素8",
                                                              @"第二组第一元素9",
                                                              @"第二组第一元素10",
                                                              @"第二组第一元素11",
                                                              @"第二组第一元素12",
                                                              
                                                              ]
                                                      },
                                                  @{
                                                      kHDClassifyLeftTableViewModelDataKeyName:@"第2元素",
                                                      kHDClassifyLeftTableViewModelDataKeyChildNode:@[
                                                              @"第二组第二元素1",
                                                              @"第二组第二元素2",
                                                              @"第二组第二元素3",
                                                              @"第二组第二元素4",
                                                              @"第二组第二元素5",
                                                              @"第二组第二元素6",
                                                              @"第二组第二元素7",
                                                              @"第二组第二元素8",
                                                              @"第二组第二元素9",
                                                              @"第二组第二元素10",
                                                              @"第二组第二元素11",
                                                              @"第二组第二元素12",
                                                              @"第二组第二元素13",
                                                              @"第二组第二元素14",
                                                              @"第二组第二元素15",
                                                              @"第二组第二元素16",
                                                              @"第二组第二元素17",
                                                              @"第二组第二元素18",
                                                              @"第二组第二元素19",
                                                              @"第二组第二元素20",
                                                              @"第二组第二元素21",
                                                              @"第二组第二元素22",
                                                              @"第二组第二元素23",
                                                              @"第二组第二元素24",
                                                              @"第二组第二元素25",
                                                              @"第二组第二元素26",
                                                              @"第二组第二元素27",
                                                              @"第二组第二元素28",
                                                              @"第二组第二元素29",
                                                              @"第二组第二元素30",
                                                              ]
                                                      }
                                                  ]
                                          }.mutableCopy];
    }
    return _dataSource;
}

@end

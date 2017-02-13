//
//  HDLeftTableHeaderView.h
//  HDClassifyTable
//
//  Created by Joyinter on 2017/2/10.
//  Copyright © 2017年 Joyinter. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const kHDLeftTableHeaderViewIdentifier;
extern NSString * const kHDLeftTableHeaderViewSetDeselectedNotification;

@protocol HDLeftTableHeaderViewDelegate;

@interface HDLeftTableHeaderView : UITableViewHeaderFooterView

@property (nonatomic, weak) id <HDLeftTableHeaderViewDelegate> delegate;
@property (nonatomic, assign) NSUInteger section;
@property (nonatomic, assign) BOOL isSelected;

- (void)configWithData:(NSDictionary *)data;

@end

@protocol HDLeftTableHeaderViewDelegate <NSObject>

- (void)classifyListHeaderView:(HDLeftTableHeaderView *)classifyHeaderView isExpended:(BOOL)isExpended isUserTapped:(BOOL)isUserTapped;

@end



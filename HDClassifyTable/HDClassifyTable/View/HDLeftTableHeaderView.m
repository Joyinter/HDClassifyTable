//
//  HDLeftTableHeaderView.m
//  HDClassifyTable
//
//  Created by Delano on 2017/2/10.
//  Copyright © 2017年 delano. All rights reserved.
//

#import "HDLeftTableHeaderView.h"
#import <HandyFrame/UIView+LayoutMethods.h>

NSString * const kHDLeftTableHeaderViewIdentifier = @"kHDLeftTableHeaderViewIdentifier";
NSString * const kHDLeftTableHeaderViewSetDeselectedNotification = @"kHDLeftTableHeaderViewSetDeselectedNotification";
extern NSString * const kHDClassifyLeftTableViewModelDataKeyName;
extern NSString * const kHDClassifyLeftTableViewModelSelected;

@interface HDLeftTableHeaderView ()

@property (nonatomic, strong) UIButton *titleButton;

@end

@implementation HDLeftTableHeaderView
@synthesize isSelected = _isSelected;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didReceivekHDLeftTableHeaderViewSetDeselectedNotification:)
                                                     name:kHDLeftTableHeaderViewSetDeselectedNotification
                                                   object:nil];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleButton fill];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kHDLeftTableHeaderViewSetDeselectedNotification object:nil];
}

#pragma mark - public methods
- (void)configWithData:(NSDictionary *)data
{
    if (data[kHDClassifyLeftTableViewModelDataKeyName]) {
        [self.titleButton setTitle:data[kHDClassifyLeftTableViewModelDataKeyName] forState:UIControlStateNormal];
    }
    self.titleButton.selected = [data[kHDClassifyLeftTableViewModelSelected] boolValue];
    self.isSelected = [data[kHDClassifyLeftTableViewModelSelected] boolValue];
    self.titleButton.backgroundColor = self.titleButton.selected ? [UIColor whiteColor]:[UIColor groupTableViewBackgroundColor];
    [self layoutSubviews];
}

#pragma mark - event response
- (void)didTappedTitleButton:(UIButton *)titleButton
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kHDLeftTableHeaderViewSetDeselectedNotification object:self];
    self.titleButton.selected = YES;
    self.isSelected = YES;
    self.titleButton.backgroundColor = [UIColor whiteColor];
    if ([self.delegate respondsToSelector:@selector(classifyListHeaderView:isExpended:isUserTapped:)]) {
        [self.delegate classifyListHeaderView:self isExpended:YES isUserTapped:YES];
    }
}

- (void)didReceivekHDLeftTableHeaderViewSetDeselectedNotification:(NSNotification *)notification
{
    if (notification.object == self) {
        if ([self.delegate respondsToSelector:@selector(classifyListHeaderView:isExpended:isUserTapped:)]) {
            [self.delegate classifyListHeaderView:self isExpended:YES isUserTapped:NO];
        }
    } else {
        self.isSelected = NO;
        if ([self.delegate respondsToSelector:@selector(classifyListHeaderView:isExpended:isUserTapped:)]) {
            [self.delegate classifyListHeaderView:self isExpended:NO isUserTapped:NO];
        }
    }
}

#pragma mark - Getters and Setters
- (UIButton *)titleButton
{
    if (_titleButton == nil) {
        _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_titleButton setTitleColor:[UIColor grayColor]forState:UIControlStateNormal];
        [_titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [self.titleButton setTitle:@"蛤蛤蛤蛤"forState:UIControlStateNormal];
        [_titleButton addTarget:self action:@selector(didTappedTitleButton:) forControlEvents:UIControlEventTouchUpInside];
        _titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _titleButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _titleButton;
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    self.titleButton.selected = isSelected;
    if (isSelected) {
        self.titleButton.backgroundColor = [UIColor whiteColor];
    } else {
        self.titleButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
}

@end

//
//  HDLeftTableViewCell.m
//  HDClassifyTable
//
//  Created by Delano on 2017/2/10.
//  Copyright © 2017年 delano. All rights reserved.
//

#import "HDLeftTableViewCell.h"
#import <HandyFrame/UIView+LayoutMethods.h>

NSString * const kHDLeftTableViewCellIdentifier = @"kHDLeftTableViewCellIdentifier";

@interface HDLeftTableViewCell ()

@end

@implementation HDLeftTableViewCell

#pragma mark - life cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel fill];
    [self.titleLabel leftInContainer:26 shouldResize:YES];
}

#pragma mark - event response
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected) {
        self.titleLabel.textColor = [UIColor orangeColor];
    }else{
        self.titleLabel.textColor = [UIColor lightGrayColor];
    }
}

#pragma mark - getters and setters
- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:13];
    }
    return _titleLabel;
}

@end

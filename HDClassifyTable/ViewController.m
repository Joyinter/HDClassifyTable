//
//  ViewController.m
//  HDClassifyTable
//
//  Created by Delano on 2017/2/10.
//  Copyright © 2017年 delano. All rights reserved.
//

#import "ViewController.h"
#import "HDClassifyTableViewController.h"
#import <HandyFrame/UIView+LayoutMethods.h>

@interface ViewController ()

@property (nonatomic, strong) UIButton *jumpButton;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.jumpButton];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.jumpButton.width = 200;
    self.jumpButton.height = 50;
    [self.jumpButton centerEqualToView:self.view];
}
#pragma mark - event response
- (void)didTappedJumpButton:(UIButton *)jumpButton
{
    HDClassifyTableViewController *vc = [[HDClassifyTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getters and setters
- (UIButton *)jumpButton
{
    if (_jumpButton == nil) {
        _jumpButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_jumpButton setTitle:@"跳转" forState:UIControlStateNormal];
        _jumpButton.backgroundColor = [UIColor blueColor];
        _jumpButton.layer.masksToBounds = YES;
        _jumpButton.layer.cornerRadius = 5;
        [_jumpButton addTarget:self action:@selector(didTappedJumpButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpButton;
}


@end

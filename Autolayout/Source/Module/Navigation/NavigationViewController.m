//
//  NavigationViewController.m
//  Autolayout
//
//  Created by liaojinxing on 14-2-11.
//  Copyright (c) 2014年 douban. All rights reserved.
//

#import "NavigationViewController.h"
#import "AutolayoutViewController.h"
#import "AutolayoutWithCodeController.h"

@interface NavigationViewController ()
{
  UIButton *_useXIBButton;
  UIButton *_intrinsicButton;
}

@end

@implementation NavigationViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self loadSubViews];
}

- (void)loadSubViews
{
  UIView *superView = self.view;
  
  _useXIBButton = [[UIButton alloc] init];
  [_useXIBButton setTitle:@"use XIB demo" forState:UIControlStateNormal];
  [_useXIBButton setBackgroundColor:[UIColor blackColor]];
  [_useXIBButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [_useXIBButton addTarget:self action:@selector(pushUseXIBController) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_useXIBButton];
  
  _intrinsicButton = [[UIButton alloc] init];
  [_intrinsicButton setTitle:@"intrinsic content size demo" forState:UIControlStateNormal];
  [_intrinsicButton setBackgroundColor:[UIColor blackColor]];
  [_intrinsicButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [_intrinsicButton addTarget:self action:@selector(pushIntrinsicController) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_intrinsicButton];
  
  NSLayoutConstraint *constraint = [NSLayoutConstraint
                constraintWithItem:_useXIBButton
                attribute:NSLayoutAttributeTop
                relatedBy:NSLayoutRelationEqual
                toItem:superView
                attribute:NSLayoutAttributeTop
                multiplier:1.0
                constant:100];
  [superView addConstraint:constraint];
  
  
  constraint = [NSLayoutConstraint
                constraintWithItem:_useXIBButton
                attribute:NSLayoutAttributeCenterX
                relatedBy:NSLayoutRelationEqual
                toItem:superView
                attribute:NSLayoutAttributeCenterX
                multiplier:1.0
                constant:0];
  [superView addConstraint:constraint];
  
  constraint = [NSLayoutConstraint
                constraintWithItem:_intrinsicButton
                attribute:NSLayoutAttributeCenterX
                relatedBy:NSLayoutRelationEqual
                toItem:superView
                attribute:NSLayoutAttributeCenterX
                multiplier:1.0
                constant:0];
  [superView addConstraint:constraint];
  
  constraint = [NSLayoutConstraint
                constraintWithItem:_intrinsicButton
                attribute:NSLayoutAttributeTop
                relatedBy:NSLayoutRelationEqual
                toItem:_useXIBButton
                attribute:NSLayoutAttributeBottom
                multiplier:1.0
                constant:100];
  [superView addConstraint:constraint];
}

- (void)pushUseXIBController
{
  AutolayoutViewController *controller = [[AutolayoutViewController alloc] initWithNibName:@"Example" bundle:nil];
  [self.navigationController pushViewController:controller animated:YES];
}

- (void)pushIntrinsicController
{
  AutolayoutWithCodeController *controller = [[AutolayoutWithCodeController alloc] init];
  [self.navigationController pushViewController:controller animated:YES];
}

@end

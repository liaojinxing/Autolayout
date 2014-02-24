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
#import "AutoresizingMaskViewController.h"

@interface NavigationViewController ()
{
  UIButton *_useXIBButton;
  UIButton *_intrinsicButton;
  UIButton *_maskButton;
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
  
  _maskButton = [[UIButton alloc] init];
  [_maskButton setTitle:@"AutoresizingMask demo" forState:UIControlStateNormal];
  [_maskButton setBackgroundColor:[UIColor blackColor]];
  [_maskButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [_maskButton addTarget:self action:@selector(pushAutoresizingMaskController) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_maskButton];
  
  NSLayoutConstraint *constraint = [NSLayoutConstraint
                constraintWithItem:_useXIBButton
                attribute:NSLayoutAttributeTop
                relatedBy:NSLayoutRelationEqual
                toItem:superView
                attribute:NSLayoutAttributeTop
                multiplier:1.0
                constant:60];
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
                constant:60];
  [superView addConstraint:constraint];
  
  constraint = [NSLayoutConstraint
                constraintWithItem:_maskButton
                attribute:NSLayoutAttributeCenterX
                relatedBy:NSLayoutRelationEqual
                toItem:superView
                attribute:NSLayoutAttributeCenterX
                multiplier:1.0
                constant:0];
  [superView addConstraint:constraint];
  
  constraint = [NSLayoutConstraint
                constraintWithItem:_maskButton
                attribute:NSLayoutAttributeTop
                relatedBy:NSLayoutRelationEqual
                toItem:_intrinsicButton
                attribute:NSLayoutAttributeBottom
                multiplier:1.0
                constant:60];
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

- (void)pushAutoresizingMaskController
{
  AutoresizingMaskViewController *controller = [[AutoresizingMaskViewController alloc] initWithNibName:@"Autoresizing" bundle:nil];
  [self.navigationController pushViewController:controller animated:YES];
}


@end

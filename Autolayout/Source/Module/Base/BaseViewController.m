//
//  BaseViewController.m
//  Autolayout
//
//  Created by liaojinxing on 14-2-24.
//  Copyright (c) 2014年 douban. All rights reserved.
//

#import "BaseViewController.h"
#import "YAPanBackController.h"
#import "UIView+YAUIKit.h"

@interface BaseViewController ()

@property (nonatomic, strong) YAPanBackController *panBackController;

@end

@implementation BaseViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self setupPanBackController];
  self.navigationController.navigationBarHidden = YES;
}

- (void)setupPanBackController
{
  _panBackController = [[YAPanBackController alloc] initWithCurrentViewController:self];
  __block UIView *maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  __block CGFloat preChangePrecent = 0;
  [_panBackController setPanBackPrelayoutsBlock:^(UIView *fromView, UIView *toView) {
    [maskView setBackgroundColor:[UIColor blackColor]];
    [maskView setAlpha:0.7];
    [toView addSubview:maskView];
    [toView setFrameOriginX:-(toView.frame.size.width / 2)];
  } panChangedBlock:^(UIView *fromView, UIView *toView, CGFloat changedPrecent) {
    [fromView setFrameOriginX:changedPrecent * fromView.bounds.size.width];
    [maskView setAlpha:(1 - changedPrecent) * 0.7];
    CGFloat changeValue = [UIScreen mainScreen].applicationFrame.size.width * (changedPrecent - preChangePrecent) / 2;
    [toView setFrameOriginX:toView.frame.origin.x + changeValue];
    preChangePrecent = changedPrecent;
  } animationsBlock:^(UIView *fromView, UIView *toView, BOOL success) {
    if (success) {
      [fromView setFrameOriginX:fromView.frame.size.width];
      [maskView setAlpha:0];
      [toView setFrameOriginX:0];
    } else {
      [fromView setFrameOriginX:0];
      [maskView setAlpha:.7];
      [toView setFrameOriginX:-(toView.frame.size.width / 2)];
    }
  } completionBlock:^(UIView *fromView, UIView *toView, BOOL success) {
    if (success) {
      [toView setFrameOriginX:0];
      [maskView removeFromSuperview];
    } else {
      [toView setFrameOriginX:-(toView.frame.size.width / 2)];
      [maskView removeFromSuperview];
    }
  }];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [_panBackController addPanBackToView:self.view];
}

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
  [_panBackController removePanBackFromView:self.view];
}

@end

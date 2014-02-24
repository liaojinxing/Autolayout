//
//  AutolayoutWIthCodeController.m
//  Autolayout
//
//  Created by liaojinxing on 14-2-10.
//  Copyright (c) 2014年 douban. All rights reserved.
//

#import "AutolayoutWithCodeController.h"
#import "UIView+FLKAutoLayout.h"

@interface AutolayoutWithCodeController ()
{
  UILabel *_label;
  UIButton *_button;
}

@end

@implementation AutolayoutWithCodeController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self addSubViews];
  [self autolayoutSubViewsUsingFLKAutoLayout];
}

- (void)addSubViews
{
  _label = [[UILabel alloc] init];
  [_label setText:@"I am a label"];
  [_label setBackgroundColor:[UIColor redColor]];
  [_label setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.view addSubview:_label];
  
  _button = [[UIButton alloc] init];
  [_button setTitle:@"I am a button" forState:UIControlStateNormal];
  [_button setBackgroundColor:[UIColor greenColor]];
  [_button setTranslatesAutoresizingMaskIntoConstraints:NO];
  [_button addTarget:self action:@selector(changeTitle) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_button];
}

//autolayout programming
- (void)autolayoutSubViews
{
  UIView *superView = self.view;
  //button align vertical center
  NSLayoutConstraint *myConstraint =[NSLayoutConstraint
                                     constraintWithItem:_button
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:superView
                                     attribute:NSLayoutAttributeCenterY
                                     multiplier:1.0
                                     constant:0];
  
  [superView addConstraint:myConstraint];
  
  //button align horizontal center
  myConstraint =[NSLayoutConstraint
                 constraintWithItem:_button
                 attribute:NSLayoutAttributeCenterX
                 relatedBy:NSLayoutRelationEqual
                 toItem:superView
                 attribute:NSLayoutAttributeCenterX
                 multiplier:1.0
                 constant:0];
  
  [superView addConstraint:myConstraint];
  
  //label and button horizontal spacing
  myConstraint =[NSLayoutConstraint constraintWithItem:_button
                                             attribute:NSLayoutAttributeTrailing
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:_label
                                             attribute:NSLayoutAttributeLeading
                                            multiplier:1
                                              constant:-10];
  
  [superView addConstraint:myConstraint];
  
  //baseline
  myConstraint =[NSLayoutConstraint constraintWithItem:_button
                                             attribute:NSLayoutAttributeBaseline
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:_label
                                             attribute:NSLayoutAttributeBaseline
                                            multiplier:1
                                              constant:0];
  
  [superView addConstraint:myConstraint];
}

- (void)autolayoutSubViewsUsingFLKAutoLayout
{
  [_button alignCenterXWithView:self.view predicate:nil];
  [_button alignCenterYWithView:self.view predicate:nil];
  [_label constrainLeadingSpaceToView:_button predicate:@"10"];
  [_button alignBaselineWithView:_label predicate:nil];
}

- (void)changeTitle
{
  NSString *changedTitle = @"intrinsic content size";
  NSString *originalTitle = @"I am a button";
  if ([[_button titleForState:UIControlStateNormal] isEqualToString:originalTitle]) {
    [_button setTitle:changedTitle forState:UIControlStateNormal];
  } else {
    [_button setTitle:originalTitle forState:UIControlStateNormal];
  }
}

@end

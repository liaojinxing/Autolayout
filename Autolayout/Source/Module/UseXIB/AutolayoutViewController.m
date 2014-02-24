//
//  AutolayoutViewController.m
//  Autolayout
//
//  Created by liaojinxing on 14-2-10.
//  Copyright (c) 2014年 douban. All rights reserved.
//

#import "AutolayoutViewController.h"

@interface AutolayoutViewController ()

@end

@implementation AutolayoutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)buttonTapped:(UIButton *)sender
{
  if ([[sender titleForState:UIControlStateNormal] isEqualToString:@"X"]) {
    [sender setTitle:@"A very long title for this button"
            forState:UIControlStateNormal];
  } else {
    [sender setTitle:@"X" forState:UIControlStateNormal];
  }
}


@end

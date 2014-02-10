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
  
 /* NSArray *xibArray = [[NSBundle mainBundle] loadNibNamed:@"Instrinsic" owner:nil options:nil];
  UIView *myView = nil;
  for (id xibObject in xibArray) {
    //Loop through array, check for the object we're interested in.
    if ([xibObject isKindOfClass:[UIView class]]) {
      //Use casting to cast (id) to (MyCustomView *)
      myView = (UIView *)xibObject;
    }
  }
  [self.view addSubview:myView];*/
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

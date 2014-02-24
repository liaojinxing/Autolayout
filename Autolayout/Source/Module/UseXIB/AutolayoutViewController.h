//
//  AutolayoutViewController.h
//  Autolayout
//
//  Created by liaojinxing on 14-2-10.
//  Copyright (c) 2014年 douban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface AutolayoutViewController : BaseViewController

@property (nonatomic, retain) IBOutlet UIView *myViewFromNib;

- (IBAction)buttonTapped:(UIButton *)sender;

@end

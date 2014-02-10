//
//  AutolayoutViewController.h
//  Autolayout
//
//  Created by liaojinxing on 14-2-10.
//  Copyright (c) 2014年 douban. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutolayoutViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIView *myViewFromNib;

- (IBAction)buttonTapped:(UIButton *)sender;

@end

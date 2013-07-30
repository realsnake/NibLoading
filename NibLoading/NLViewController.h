//
//  NLViewController.h
//  NibLoading
//
//  Created by snake on 13-7-10.
//  Copyright (c) 2013年 snake. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIButton *button;
@property (nonatomic, weak) IBOutlet UILabel *label;

- (IBAction)buttonTouched:(id)sender;

@end

//
//  NLViewController.m
//  NibLoading
//
//  Created by snake on 13-7-10.
//  Copyright (c) 2013年 snake. All rights reserved.
//

#import "NLViewController.h"

@interface NLViewController ()
@end

@implementation NLViewController
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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// the -init method is overridden to use nib file from bundle, if bundle exists ...
- (id)init
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *file = [documentsDirectory stringByAppendingPathComponent:@"BundleGenerator.bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:file];
    if (!bundle)
    {
        NSLog(@"no bundle found, falling back to default gui ...");
        return [self initWithNibName:nil bundle:nil];
    }
    
    NSString *nibName = NSStringFromClass([self class]);
    return [self initWithNibName:nibName bundle:bundle];
}

- (void)loadView
{
    if (self.nibName && self.nibBundle)
    {
        // connect outlets to proxy objects ...
        NSDictionary *objects = [NSDictionary dictionaryWithObjectsAndKeys:
                                 self.label, @"label",
                                 //self.button, @"button",
                                 nil];
        NSDictionary *proxies = [NSDictionary dictionaryWithObject:objects forKey:UINibExternalObjects];
        NSArray *nibs = [self.nibBundle loadNibNamed:self.nibName owner:self options:proxies]; // connection happens here ...
        
        NSLog(@"nibs found with name %@: %d", self.nibName, [nibs count]);
        return;
    }
    
    // show default gui if no nib was found ...
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    self.view = [[UIView alloc] initWithFrame:frame];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setFrame:CGRectMake(0.0f, 0.0f, 60.0f, 30.0f)];
    [self.button setCenter:CGPointMake(160.0f, 100.0f)];
    [self.button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 300.0f, 30.0f)];
    [self.label setCenter:CGPointMake(160.0f, 50.0f)];
    [self.label setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.label];
}

- (IBAction)buttonTouched:(id)sender
{
    self.label.text = @"Button touched.";
}

@end

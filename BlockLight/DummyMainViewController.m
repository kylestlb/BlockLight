//
//  DummyMainViewController.m
//  BlockLight
//
//  Created by Kyle St. Leger-Barter on 3/20/13.
//  Copyright (c) 2013 BlockLight. All rights reserved.
//

#import "DummyMainViewController.h"
#import "DummyMainView.h"
#import "AppDelegate.h"

@interface DummyMainViewController ()

@end

@implementation DummyMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
	DummyMainView* mainView = [[DummyMainView alloc] initWithFrame:CGRectZero andViewController:self];
	self.view = mainView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

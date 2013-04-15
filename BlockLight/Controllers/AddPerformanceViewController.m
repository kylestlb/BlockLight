//
//  AddPerformanceViewController.m
//  BlockLight
//
//  Created by Barrett Ames on 8/29/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "AddPerformanceViewController.h"

@interface AddPerformanceViewController ()

@end

@implementation AddPerformanceViewController

- (id)initWithGroup:(Group*)group{
  self = [super init];
  if (self) {
    
    _group = group; 
    // Custom initialization
    CreatePerformance* createPerformance = [[CreatePerformance alloc] initWithFrame:CGRectZero];
    self.view = createPerformance;
    self.title = @"Add A Performance";
    UIBarButtonItem* save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                          target:self
                                                                          action:@selector(saveMember)];
    save.tintColor = [UIColor blueColor];
    
    self.navigationItem.rightBarButtonItem=save;
  }
  return self;
}

-(CreatePerformance*)contentView{
  return (CreatePerformance*)self.view; 
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(void)saveMember{
  
  
  Production* newProduction = [[Production alloc] init];
  newProduction.name = [self contentView].name.text;
  newProduction.date = [self contentView].date.text;
  newProduction.location = [self contentView].location.text;
  newProduction.stageManager = [self contentView].stageManager.text; 

  [_group.productions addObject:newProduction]; 
  
  [_performanceTable reloadData];
  
  [_performancePopover dismissPopoverAnimated:YES];
  
  
}

@end

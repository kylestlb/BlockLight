//
//  StageEditorController.m
//  BlockLight
//
//  Created by Barrett Ames on 7/30/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "StageEditorController.h"

@implementation StageEditorController

/** Note: clicking 'Edit Stage' button will cause app to slide to new window
	Try to make edit options just pop up in current window **/
#pragma mark Accessors
-(StageEditor*)contentView {
  return (StageEditor*)self.view;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
  self.view = [[StageEditor alloc] init ]; 
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  //Set up navigation bar style and buttons for Tool Bar
  [self.navigationController.toolbar setTintColor:[UIColor blackColor]];
  

  
  self.title = @"Edit Stage"; 
  self.navigationItem.leftItemsSupplementBackButton = YES; 
  // Top Left Buttons - appear on scree, but don't do anything
  
  UIBarButtonItem* undo = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo 
                                                                        target:self 
                                                                        action:nil];
  
  UIBarButtonItem* redo = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRedo 
                                                                        target:self 
                                                                        action:nil];
  
  UIBarButtonItem* back =  [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                           style:UIBarButtonItemStyleBordered
                                                                          target:nil
                                                                          action:nil];
  
  self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:back, undo,redo, nil];
  
  // Top Right Buttons - appear on screen, but don't do anything
  UIBarButtonItem* cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" 
                                                                style:UIBarButtonItemStyleBordered 
                                                               target:self 
                                                               action:nil]; 
  
  UIBarButtonItem* save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
                                                                        target:self 
                                                                        action:nil];  
  save.tintColor = [UIColor blueColor]; 
  
  
  self.navigationItem.rightBarButtonItems =[NSArray arrayWithObjects: save, cancel, nil]; 
  

  // Edit Stage Buttons - sets buttons defined above to window
  
  [[self contentView].selectPreset addTarget:self action:@selector(selectPreset) forControlEvents:UIControlEventTouchUpInside]; 
  
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return YES;
}

// Open a UIPicker for selecting preset 
// This makes a picker view appear over edit options
// Trying to select a preset stage does nothing
-(void) selectPreset {
  UIViewController* presetViewController = [[UIViewController alloc] init]; 
  
  UIPickerView* presetSelector = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 216)]; 
  UIView* wrapper = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320,216)]; 
  [wrapper addSubview:presetSelector]; 
  presetViewController.view = wrapper; 
  presetSelector.dataSource = self; 
  presetSelector.delegate   = self; 
  presetSelector.showsSelectionIndicator = YES; 
  
  _presetPopover = [[UIPopoverController alloc] initWithContentViewController:presetViewController];
  [_presetPopover setPopoverContentSize:CGSizeMake(320,216)]; 
  [_presetPopover presentPopoverFromRect:[self contentView].selectPreset.frame 
                                  inView:[self contentView]
                permittedArrowDirections:UIPopoverArrowDirectionAny 
                                animated:YES]; 
  
}

// UIPickerViewDataSource methods 
// There should only be one column in the picker view 
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return 1; 
}

// number of rows in picker view
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
  return 2; 
}

//UIPickerViewDelegate Methods 
//dimensions of cells in picker view
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
  return 25.0; 
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
  return 150.0; 
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  return @"Stage Name"; //need to have a different name for each preset stage
}

@end

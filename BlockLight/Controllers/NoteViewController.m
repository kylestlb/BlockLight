//
//  NoteViewController.m
//  BlockLight
//
//  Created by Barrett Ames on 9/3/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "NoteViewController.h"

@interface NoteViewController ()

@end


@implementation NoteViewController

@synthesize popover = _popover;


- (id)initWithFrame:(Frame*) frame
{
    self = [super init];
    if (self) {
        // Custom initialization
      self.view = [[NoteView alloc ] initWithViewController:self];
      _frame = frame; 
      
    }
    return self;
}

-(NoteView*)contentView{
  return (NoteView*)self.view; 
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

-(void)addNoteView{
  _frame.note = [self contentView].noteInput.text;
  [_popover dismissPopoverAnimated:NO];
  [_popover.delegate popoverControllerDidDismissPopover:_popover]; 
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end

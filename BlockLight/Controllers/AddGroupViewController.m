//
//  AddGroupViewController.m
//  BlockLight
//
//  Created by Barrett Ames on 8/21/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "AddGroupViewController.h"

@interface AddGroupViewController ()

@end

@implementation AddGroupViewController

@synthesize popover = _popover;
@synthesize table = _table;
@synthesize picker = _picker; 
- (id)init
{
    self = [super init];
    if (self) {
      CreateGroupView* createGroup = [[CreateGroupView alloc] initWithFrame:CGRectZero];
      self.view = createGroup;
      self.title = @"Create A Group";
      UIBarButtonItem* save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                            target:self
                                                                            action:@selector(saveGroup)];
      save.tintColor = [UIColor blueColor];
      
      self.navigationItem.rightBarButtonItem=save;
      
    }
    return self;
}

-(CreateGroupView*) contentView{
  return (CreateGroupView*) self.view; 
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)saveGroup{
  
  AppDelegate *mainDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
  
  Group* newGroup = [[Group alloc] init];
  newGroup.name = [self contentView].name.text;
  newGroup.uniqueID = mainDelegate.userData.nextUniqueGroupID;
  [mainDelegate.userData.groups addObject:newGroup];
  
  [_popover dismissPopoverAnimated:YES];
  [_table reloadData];
  [_picker reloadAllComponents];
  [_picker selectRow:([mainDelegate.userData.groups count]-1) inComponent:0 animated:NO]; 
  [_picker.delegate pickerView:_picker didSelectRow:([mainDelegate.userData.groups count]-1) inComponent:0];
   
}

@end

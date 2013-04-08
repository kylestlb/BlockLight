//
//  AddGroupViewController.m
//  BlockLight
//
/*
 Jordan: This view appears as part of the Contacts View. To get to it, the user must first click on
 the "Contacts" tab to the left side menu of the Home Detail View. Then, when the user clicks on
 the "Add Group" button, this controller instantiates a Group View from the view classes and has
 it appear as a popover asking the user to enter in the group information in the name and input fields.
 the controller listens for the "Save" button to be pressed and creates a group accordingly.
 */
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
    if (self)
    {
        // make the view with the group name and type input fields (see CreateGroupView.m)
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

-(CreateGroupView*) contentView
{
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

-(void)saveGroup
{
    // get shared app delegate
    AppDelegate *mainDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    // create a new group based on entry in two input fields
    // TODO: check if name and type fields are empty
    Group* newGroup = [[Group alloc] init];
    newGroup.name = [self contentView].name.text;
    newGroup.type = [self contentView].type.text;
    newGroup.uniqueID = mainDelegate.userData.nextUniqueGroupID; // assign unique ID
    [mainDelegate.userData.groups addObject:newGroup]; // add group to delegate data
    
    // close create group popup menu and contacts menu
    // reloads the Contacts View with the new Group Name at the top and an empty contacts
    [_popover dismissPopoverAnimated:YES];
    [_table reloadData];
    [_picker reloadAllComponents];
    [_picker selectRow:([mainDelegate.userData.groups count]-1) inComponent:0 animated:NO];
    [_picker.delegate pickerView:_picker didSelectRow:([mainDelegate.userData.groups count]-1) inComponent:0];
    
}

@end

//
//  ContactsViewController.m
//  BlockLight
//
//  Created by Barrett Ames on 8/16/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "ContactsViewController.h"
#import "AppDelegate.h"
@interface ContactsViewController ()

@end
AppDelegate* _mainDelegate;



@implementation ContactsViewController

- (id)init
{
  self = [super init];
  if (self) {
    
    self.title = @"Contacts";
    _mainDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    UIView* contactView = [[ContactsView alloc] initWithDelegate:self];
    self.view = contactView;
    
    _groupTable =[[UITableView alloc] initWithFrame:CGRectMake(-25, 25, 750, 200) style:UITableViewStyleGrouped];
    _groupTable.delegate = self;
    _groupTable.dataSource = self;
    _groupTable.backgroundColor = [ UIColor clearColor];
    _groupTable.opaque = NO;
    _groupTable.backgroundView = nil; // background;
    _groupTable.scrollEnabled = NO;
    
    _contactTable =[[UITableView alloc] initWithFrame:CGRectMake(-25, 260, 750, 400) style:UITableViewStyleGrouped];
    _contactTable.delegate = self;
    _contactTable.dataSource = self;
    _contactTable.backgroundColor = [ UIColor clearColor];
    _contactTable.opaque = NO;
    _contactTable.backgroundView = nil; // background;
    
    // Setup for UI Pickerview
    UIViewController* groupViewController = [[UIViewController alloc] init];
    
    _groupSelector = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
    UIView* wrapper = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320,216)];
    [wrapper addSubview:_groupSelector];
    groupViewController.view = wrapper;
    _groupSelector.dataSource = self;
    _groupSelector.delegate   = self;
    _groupSelector.showsSelectionIndicator = YES;
    
    _groupPopover = [[UIPopoverController alloc] initWithContentViewController:groupViewController];
    [_groupPopover setPopoverContentSize:CGSizeMake(320,216)];
    
    if([_mainDelegate.userData.groups count] > 0)
      _filterGroup = [_mainDelegate.userData.groups objectAtIndex:0]; 
    
    [self.view addSubview:_groupTable];
    [self.view addSubview:_contactTable];
    
  }
  return self;
}

-(ContactsView*) contentView {
  return (ContactsView*) self.view;
}

-(void) viewWillAppear:(BOOL)animated{
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  NSInteger sections = 0;
  if([_groupTable isEqual:tableView]){
    sections = [_mainDelegate.userData.groups count];
  }
  else if([_contactTable isEqual:tableView]){
    sections = [_filterGroup.performers count];
  }
  
  return sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
  return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell;
  
  if([tableView isEqual:_groupTable]){
    
    static NSString *CellIdentifier = @"Cell2";
    
    cell = [[GroupViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier andGroup:_filterGroup];
    cell.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:.5];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
  }
  else if ( [tableView isEqual:_contactTable]){
    
    static NSString *CellIdentifier = @"Cell3";

      
      Performer* performer = [_filterGroup.performers objectAtIndex:indexPath.section];
      cell = [[performerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier withPerformer:performer];
      cell.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:.5];
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
  }
  return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  return 150.0;
}

-(void)filterBy{
  
  [_groupPopover presentPopoverFromRect: [self contentView].filterBy.frame
                                 inView:self.view
               permittedArrowDirections:UIPopoverArrowDirectionAny
                               animated:YES];
  
}

-(void)addGroupPopover{
  AddGroupViewController* groupAddViewController = [[AddGroupViewController alloc] init];
  
  
  UINavigationController* container = [[UINavigationController alloc] initWithRootViewController:groupAddViewController];
  
  groupAddViewController.contentSizeForViewInPopover = CGSizeMake(320, 120);
  _addGroupPopover = [[UIPopoverController alloc] initWithContentViewController:container];
  [_addGroupPopover presentPopoverFromRect:[self contentView].addGroup.frame inView:[self contentView] permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
  groupAddViewController.popover = _addGroupPopover;
  groupAddViewController.table = _groupTable;
  groupAddViewController.picker = _groupSelector;
  
}

-(void)addMemberPopover{
  AddMemberViewController* memberAddViewController = [[AddMemberViewController alloc] init];
  
  
  UINavigationController* container = [[UINavigationController alloc] initWithRootViewController:memberAddViewController];
  
  memberAddViewController.contentSizeForViewInPopover = CGSizeMake(340, 300);
  _addMemberPopover = [[UIPopoverController alloc] initWithContentViewController:container];
  [_addMemberPopover presentPopoverFromRect:[self contentView].addMember.frame inView:[self contentView] permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
  
  memberAddViewController.popover = _addMemberPopover;
  memberAddViewController.group = _filterGroup;
  memberAddViewController.contactTable = _contactTable;
  memberAddViewController.groupTable = _groupTable;
}




// UIPickerViewDataSource methods
// There should only be one column
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
  return 1;
}

// number of rows
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
  return [_mainDelegate.userData.groups count];
}

//UIPickerViewDelegate Methods
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
  return 25.0;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
  return 275.0;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  Group* group = [_mainDelegate.userData.groups objectAtIndex:row];
  return group.name;
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
  _filterGroup = [_mainDelegate.userData.groups objectAtIndex:row];
  [_groupTable reloadData];
  [_contactTable reloadData]; 
}

@end

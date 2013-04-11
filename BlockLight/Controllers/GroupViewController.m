//
//  GroupViewController.m
//  BlockLight
//
//  Created by Barrett Ames on 8/6/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "GroupViewController.h"
#import "AppDelegate.h"

@interface GroupViewController ()

@end

AppDelegate* _mainDelegate;

//Shows list of saved production groups

@implementation GroupViewController

- (id)init
{
    self = [super init];
    if (self) {
      
      _mainDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
      _table =[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
      _table.delegate = self;
      _table.dataSource = self;
      _table.backgroundColor = [ UIColor clearColor];
      _table.opaque = NO; 
      _table.backgroundView = nil; // background;
      self.view = _table;
      self.title = @"Production Groups"; 
      

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated{
  [_table reloadData]; 
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
 
  return  [_mainDelegate.userData.groups count] ;
;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
  return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    Group* group = [_mainDelegate.userData.groups objectAtIndex:indexPath.section]; 
    cell = [[GroupViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier andGroup:group];
    cell.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:.5];
    cell.selectionStyle = UITableViewCellSelectionStyleNone; 
  }
  
  return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  return 150.0;
}

// How to repsond to the row that got selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  NSInteger section  = [indexPath section];

  Group* group = [_mainDelegate.userData.groups objectAtIndex:section];
  
  ProductionViewController * productionViewController = [[ProductionViewController alloc] initWithGroup:group ];
  
  [self.navigationController pushViewController:productionViewController animated:YES];
  
  
  homeMasterViewController* masterViewController = [self.splitViewController.viewControllers objectAtIndex:0];
  HomeMasterView* masterView = (HomeMasterView*)masterViewController.view;
  UIImage* icon = [UIImage imageNamed:@"testImage"];
  [masterView groupView:YES];
  [masterView groupImage:icon withName:group.name];
  [masterView setNeedsDisplay];
  
}


@end

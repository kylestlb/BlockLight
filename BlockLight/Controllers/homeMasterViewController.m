//
//  homeMasterViewController.m
//  BlockLight
//
//  Created by Barrett Ames on 8/6/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//


//import header
#import "homeMasterViewController.h"

@interface homeMasterViewController ()

@end

@implementation homeMasterViewController

//self initializing constructor, allocates space for itself (need for every controller object)
- (id)init
{
  self = [super init];
  if (self) {
    
    self.view = [[MasterView alloc] initWithDelegate:self];

  }
  return self;
}

//calls parent DidLoad method - might need to edit once we get other views incorporated?
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

//this method is taken from standard libraries I believe, flips UI if iPad is tilted.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

//self explanatory - number of buttons on table on left hand side.  need to delete/add more
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 5;   //changed this to 5 from 3
}

//sets up table view to be called later
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    switch (section)
    {
    case 0: //section zero is the left hand side table I believe
        rows = 1; // was 6 for calendar
        break;
    case 1:
        rows = 1;
        break;
    case 2:
        rows = 1;
        break;
	case 3:
        rows = 1;
        break;
    case 4:
        rows = 1;
        break;
    default:
        break;
    }
    return rows;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  //this gigantic method lays out the buttons etc that are referred to by section and row ints
  NSInteger section = [indexPath section];
  NSInteger row = [indexPath row];
  
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) { //creates memory for the cell if it hasn't been instantiated
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone; 
  }
  
  if (section == 0 && row == 0){
    
    UIImage* button = [UIImage imageNamed:@"bg-bar-red"];
    cell.backgroundView = [[UIImageView alloc] initWithImage:button];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = @"Groups";
    
  }
  //we can turn these buttons into views for things we actually need e.g. set objects, users etc
 else if(section ==1 && row == 0){
    UIImage* button = [UIImage imageNamed:@"bg-bar-blue"];
    cell.backgroundView = [[UIImageView alloc] initWithImage:button];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = @"Productions"; 
    
  }
  
 else if(section ==2 && row == 0){
    UIImage* button = [UIImage imageNamed:@"bg-bar-green"];
    cell.backgroundView = [[UIImageView alloc] initWithImage:button];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = @"Contacts";
  }
 else if(section ==3 && row == 0){
	 UIImage* button = [UIImage imageNamed:@"bg-bar-violet"];
    cell.backgroundView = [[UIImageView alloc] initWithImage:button];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = @"Quick Stage Blocking";
	}
 else if(section ==4 && row == 0){
	 UIImage* button = [UIImage imageNamed:@"bg-bar-blue"];
     cell.backgroundView = [[UIImageView alloc] initWithImage:button];
     cell.backgroundColor = [UIColor clearColor];
     cell.textLabel.textColor = [UIColor whiteColor];
     cell.textLabel.text = @"Media";
 }
    
  return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  //this is the spacing between buttons / rows I believe.
  return 46.0;
}

// How to repsond to the row that got selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
  
    AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    switch (section)
    {
    case 0: // calendar pressed
    {
        if([appDelegate.navController visibleViewController].title != @"Production Groups")
        {
            homeDetailViewController* detailViewController = [[homeDetailViewController alloc] init];
            [appDelegate.navController setRootViewController:detailViewController];
        }
    }
        break;
    case 1: // Media pressed
    {
        if([appDelegate.navController visibleViewController].title != @"Productions")
        {
            GroupViewController* groupViewController = [[GroupViewController alloc] init];
            [appDelegate.navController setRootViewController:groupViewController];
        }
    }
        break;
    case 2: // Contacts pressed
    {
        if([appDelegate.navController visibleViewController].title != @"Contacts")
        {
            ContactsViewController* contactsViewController = [[ContactsViewController alloc] init];
            [appDelegate.navController setRootViewController:contactsViewController];
        }
    }
        break;
	case 3:
    {
        //AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate toggleSandboxView];
	}
        break;
    case 4: // media pressed
        break;
    default:
        break;
    }
}

@end

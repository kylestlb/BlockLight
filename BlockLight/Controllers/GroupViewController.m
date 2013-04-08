//
//  GroupViewController.m
//  BlockLight
//
/*
 Jordan: This is the controller for the screen the user is brought to when he/she selects a Production Group.
 A list of Production Groups are shown to the user upon start up at the Home Detail View.
 Production Groups must first be created in the Contacts View before being shown in the Home Detail View.
 Currently there are two main sections shown in the Group View:
 Preformances with a "Create Performance" button.
 Archives with a "View More" tab
 */
//
//  Created by Barrett Ames on 8/14/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "GroupViewController.h"

@interface GroupViewController ()
@end


@implementation GroupViewController

// initWithGroup sets up the UI
- (id)initWithGroup:(Group*)group
{
    self = [super init];
    if (self)
    {
        self.title = @"Productions";
        _group = group;
        UIView* groupHome = [[UIView alloc] initWithFrame:CGRectZero];
        self.view = groupHome;
        
        // code for "Performances" header label
        UILabel* performances = [[UILabel alloc] initWithFrame:CGRectMake(25, 70, 200, 35)];
        performances.text = @"Performances";
        performances.textColor =[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:.8 ];
        performances.backgroundColor = [UIColor clearColor];
        
        // code for "Create Performance" button
        _createProduction = [UIButton buttonWithType:UIButtonTypeCustom];
        _createProduction.frame = CGRectMake(530, 70, 150, 25);
        [_createProduction setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        _createProduction.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] ;
        [_createProduction setTitle:@"Create Performance" forState:UIControlStateNormal];
        _createProduction.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:15];
        _createProduction.titleLabel.textColor = [UIColor whiteColor];
        _createProduction.layer.cornerRadius = 7.0f;
        _createProduction.layer.shadowColor = [UIColor grayColor].CGColor;
        _createProduction.layer.shadowOffset = CGSizeMake(0, 1);
        [_createProduction addTarget:self action:@selector(createProduction) forControlEvents:UIControlEventTouchUpInside];
        
        // horizontal line below Performances's header and button
        UIView* topLine = [[UIView alloc] initWithFrame:CGRectMake(25, 100, 655, 2)];
        topLine.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:.5 ];
        
        // code for table of all created Performances
        _performanceTable =[[UITableView alloc] initWithFrame:CGRectMake(0, 105, 700, 360) style:UITableViewStyleGrouped];
        _performanceTable.delegate = self;
        _performanceTable.dataSource = self;
        _performanceTable.backgroundColor = [ UIColor clearColor];
        _performanceTable.opaque = NO;
        _performanceTable.backgroundView = nil; // background;
        
        
        
        // code for "Archives" header label
        UILabel* archives = [[UILabel alloc] initWithFrame:CGRectMake(25, 475, 200, 35)];
        archives.text = @"Archives";
        archives.textColor =[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:.8 ];
        archives.backgroundColor = [UIColor clearColor];
        
        // code for "View More" button
        UIButton* viewMore = [UIButton buttonWithType:UIButtonTypeCustom];
        viewMore.frame = CGRectMake(580, 475, 100, 25);
        [viewMore setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        viewMore.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] ;
        [viewMore setTitle:@"View More" forState:UIControlStateNormal];
        viewMore.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:15];
        viewMore.titleLabel.textColor = [UIColor whiteColor];
        viewMore.layer.cornerRadius = 7.0f;
        viewMore.layer.shadowColor = [UIColor grayColor].CGColor;
        viewMore.layer.shadowOffset = CGSizeMake(0, 1);
        // TODO: add code for target function for when user presses button, similar to create production button above
        
        // horizontal line below Archives's header and button
        UIView* bottomLine = [[UIView alloc] initWithFrame:CGRectMake(25, 505, 655, 2)];
        bottomLine.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:.5 ];
        
        // TODO: missing code for table of archive contents
        
        
        // add subviews to main view
        [self.view addSubview:performances];
        [self.view addSubview:_createProduction];
        [self.view addSubview:topLine];
        [self.view addSubview:_performanceTable];
        [self.view addSubview:archives];
        [self.view addSubview:viewMore];
        [self.view addSubview:bottomLine];
        //[self.view addSubview:_archiveTable];
    }
    return self;
}

/* start basic view code */
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

- (void)viewWillDisappear:(BOOL)animated
{
    homeMasterViewController* masterViewController = [self.splitViewController.viewControllers objectAtIndex:0];
    MasterView* masterView = (MasterView*)masterViewController.view;
    [masterView groupView:NO];
    [masterView setNeedsDisplay];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
/* end basic view code */

/* start table implemenation code */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_group.productions count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Production* production = [_group.productions objectAtIndex:indexPath.section];
    
    static NSString *CellIdentifier = @"Cell2";
    
    UITableViewCell* cell = [[GroupViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier andViewController:self andProduction:production andRow:indexPath.section];
    cell.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:.5];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0;
}
/* end table implementation code */

// called when user presses "Edit Production" button on a Production
-(void)editProduction:(id)sender
{
    UIButton* button = (UIButton*)sender;
    AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //[appDelegate toggleSplitViewWithProduction:[_group.productions objectAtIndex:button.tag ] andGroup:_group];
    
    editProductionViewController* contactsViewController = [[editProductionViewController alloc] init];
    [appDelegate.navController pushViewController:contactsViewController animated:YES];
}

// called when "Create Performance" button is pressed
-(void)createProduction
{
    AddPerformanceViewController* performanceAddViewController = [[AddPerformanceViewController alloc] initWithGroup:_group];
    
    UINavigationController* container = [[UINavigationController alloc] initWithRootViewController:performanceAddViewController];
    
    performanceAddViewController.contentSizeForViewInPopover = CGSizeMake(320, 160);
    _addPerformancePopover = [[UIPopoverController alloc] initWithContentViewController:container];
    [_addPerformancePopover presentPopoverFromRect:_createProduction.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    performanceAddViewController.performancePopover = _addPerformancePopover;
    performanceAddViewController.performanceTable = _performanceTable;
}


@end
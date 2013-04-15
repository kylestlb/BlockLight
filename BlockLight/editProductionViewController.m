//
//  editProductionViewController.m
//  BlockLight
//
//  Created by Jordan Nguyen on 4/4/13.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "editProductionViewController.h"
#import "AppDelegate.h"

@interface editProductionViewController ()
@end

AppDelegate* _mainDelegate;

@implementation editProductionViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"Production Details";
        _mainDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        UIView* editView = [[editProductionView alloc] initWithDelegate:self];
        self.view = editView;
        
        _contactTable =[[UITableView alloc] initWithFrame:CGRectMake(-25, 260, 750, 400) style:UITableViewStyleGrouped];
        _contactTable.delegate = self;
        _contactTable.dataSource = self;
        _contactTable.backgroundColor = [ UIColor clearColor];
        _contactTable.opaque = NO;
        _contactTable.backgroundView = nil; // background;
        
        _filterGroup = [_mainDelegate.userData.groups objectAtIndex:0]; 
        
        [self.view addSubview:_contactTable];
    }
    return self;
}

-(editProductionView*) contentView {
    return (editProductionView*) self.view;
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
    NSInteger sections = [_filterGroup.performers count];
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
    
    static NSString *CellIdentifier = @"Cell2";
        
    Performer* performer = [_filterGroup.performers objectAtIndex:indexPath.section];
    cell = [[performerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier withPerformer:performer];
    cell.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:.5];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150.0;
}

-(void)addMemberPopover{
    AddMemberViewController* memberAddViewController = [[AddMemberViewController alloc] init];
    
    
    UINavigationController* container = [[UINavigationController alloc] initWithRootViewController:memberAddViewController];
    
    memberAddViewController.contentSizeForViewInPopover = CGSizeMake(340, 300);
    _addMemberPopover = [[UIPopoverController alloc] initWithContentViewController:container];
    [_addMemberPopover presentPopoverFromRect:[self contentView].addMemberButton.frame inView:[self contentView] permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    memberAddViewController.popover = _addMemberPopover;
    memberAddViewController.group = _filterGroup;
    memberAddViewController.contactTable = _contactTable;
}



@end

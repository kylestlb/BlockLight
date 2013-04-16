//
//  MainViewController.m
//  BlockLight
//
//  NOTE: This needs to be refactored for several reasons, mostly due to the length creating an overly difficult file to navigate #pragmas may also
//  help with navigation. The length is due largely to the complexity and number of the actions that take place in this view.
//
//  This file contains all of the controller code for the main view of the stage.
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "DummyMainViewController.h"
#import "DummyMainView.h"
#import "AppDelegate.h"

@implementation DummyMainViewController

@synthesize setPopover  = _setPopover;
@synthesize viewPopover = _viewPopover;
@synthesize performerPopover = _performerPopover;

/*
//not sure how we'll be implementing productions yet, so this might be changed
- (id)initWithProduction:(Production*)production andGroup:(Group*)group
{
	//this initializes main view when a production is initialized
	self = [super init];
	if (self == nil)
		return nil;
	
	_group = group;
	_production = production;
	self.title = production.name;
	
	if ([production.frames count] == 0) {
		[production.frames addObject:[[Frame alloc]init] ];
	}
	
	return self;
}*/


#pragma mark Accessors

-(DummyMainView*)contentView{
	return (DummyMainView*)self.view;
}
- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
	DummyMainView* mainView = [[DummyMainView alloc] initWithFrame:CGRectZero andViewController:self];
	self.view = mainView;
	
	_production = [[Production alloc] init];
	_group = [[Group alloc] init];
	
	Scene* current = [[Scene alloc] init];
	if ([current.frames count] == 0) {
		[current.frames addObject:[[Frame alloc]init] ];
	}
	
	if ([_production.scenes count] == 0) {
		[_production.scenes addObject:current];
	}

	
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	[super viewDidLoad];
	AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	[appDelegate toggleSplitViewWithProduction:_production andGroup:_group];

	//Set up navigation bar style and buttons for Tool Bar
	[self.navigationController.toolbar setTintColor:[UIColor blackColor]];
	
	
	// Left Buttons
	
	UIBarButtonItem* undo = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo
																		  target:self
																		  action:nil];
	
	UIBarButtonItem* redo = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRedo
																		  target:self
																		  action:nil];
	
	UIBarButtonItem* back = [[UIBarButtonItem alloc] initWithTitle:@"Back"
															 style:UIBarButtonItemStyleBordered
															target:self
															action:@selector(backToSplit)];
	
	UIBarButtonItem* editStage = [[UIBarButtonItem alloc] initWithTitle:@"Edit Stage"
																  style:UIBarButtonItemStyleBordered
																 target:self
																 action:@selector(showStageEditor)];
	
	_viewButton = [[UIBarButtonItem alloc] initWithTitle:@"View"
												   style:UIBarButtonItemStylePlain
												  target:self
												  action:@selector(viewPopoverAction)];
	
	
	self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:back, undo,redo,editStage,_viewButton, nil];
	
	// Right Buttons
	/*UIBarButtonItem* formation = [[UIBarButtonItem alloc] initWithTitle:@"Formation"
	 style:UIBarButtonItemStyleBordered
	 target:self
	 action:@selector(formationSelector)];
	 formation.tintColor= [UIColor grayColor]; */ // TODO: implement this later
	
	_setPieces = [[UIBarButtonItem alloc] initWithTitle:@"Set Pieces"
												  style:UIBarButtonItemStyleBordered
												 target:self
												 action:@selector(setPiecesPopover)];
	
	_notes = [[UIBarButtonItem alloc] initWithTitle:@"Notes"
											  style:UIBarButtonItemStyleBordered
											 target:self
											 action:@selector(addNote)];
	
	
	_performers = [[UIBarButtonItem alloc] initWithTitle:@"Performers"
												   style:UIBarButtonItemStyleBordered
												  target:self
												  action:@selector(performerPopoverAction)];
	
	UIBarButtonItem* save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
																		  target:self
																		  action:@selector(saveIcon)];
	save.tintColor = [UIColor blueColor];
	//need to add controller or functionality for saving?
	self.navigationItem.rightBarButtonItems =[NSArray arrayWithObjects: save, _setPieces, _notes, _performers, nil];
	
	
	
	//Timeline setup
	_timeline = [[UITableView alloc] initWithFrame:CGRectMake(50, 505, 600, 50) style:UITableViewStyleGrouped];
	_timeline.delegate = self;
	_timeline.dataSource = self;
	_timeline.separatorStyle = UITableViewCellSeparatorStyleNone;
	// Rotates the view.
	CGAffineTransform transform = CGAffineTransformMakeRotation(-1.5707963);
	_timeline.transform = transform;
	// Repositions and resizes the view.
	CGRect contentRect = CGRectMake(60, 640, 900, 65);
	_timeline.frame = contentRect;
	_timeline.pagingEnabled= NO;
	_timeline.backgroundView = nil;
	_timeline.backgroundView = [[UIView alloc] init] ;
	_timeline.backgroundColor = [UIColor lightTextColor];
	
	// Selects the current frame in the time line
	Scene* current = [_production.scenes objectAtIndex:0];
	NSIndexPath *ip=[NSIndexPath indexPathForRow:current.curFrame inSection:0]; //need to find where curFrame is defined and edit
	[_timeline selectRowAtIndexPath:ip animated:NO scrollPosition:UITableViewScrollPositionBottom];
	
	// Creating the Production options button
	_productionOptions = [UIButton buttonWithType:UIButtonTypeCustom];
	_productionOptions.frame = CGRectMake(960, 640, 65, 65);
	UIImage* productionImage = [UIImage imageNamed:@"production-settings"];
	UIImageView* productionView = [[UIImageView alloc] initWithImage:productionImage];
	productionView.frame = CGRectMake(18, 5, 28, 31);
	//label sits on top of button
	UILabel* productionLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 35, 65, 15)];
	productionLabel.text = @"Production";
	productionLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
	productionLabel.backgroundColor = [UIColor clearColor];
	
	_productionOptions.backgroundColor = [UIColor lightTextColor];
	[_productionOptions addSubview:productionView];
	[_productionOptions addSubview:productionLabel];
	[_productionOptions addTarget:self action:@selector(productionOptionsAS) forControlEvents:UIControlEventTouchUpInside];
	
	
	// Add button and table to view
	[[self contentView] addSubview:_productionOptions];
	[[self contentView] addSubview:_timeline];
	
	
}


- (void)viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	// Return YES for supported orientations
	// TODO: some of these viewControllers have this correct, and others don't, need to resolve this
	return YES;
}

// Push stage editor view
-(void)showStageEditor{
	DimensionsViewController* editor = [ [ DimensionsViewController alloc] init];
	[self.navigationController pushViewController:editor animated:YES];
}

// Actions for creating a formation
-(void)formationSelector{
	
}


// Add a note to the stage that is draggable
-(void) addNote{
	//NOTE: Resizes when text entering pops up, might consider decreasing size of popover
	
	Scene* current = [_production.scenes objectAtIndex:0];
	NoteViewController* noteViewController = [[NoteViewController alloc] initWithFrame:[current.frames objectAtIndex:current.curFrame]];
	noteViewController.title = @"Notes";
	
	_noteNav = [[UINavigationController alloc] initWithRootViewController:noteViewController];
	
	noteViewController.contentSizeForViewInPopover = CGSizeMake(320,400);
	
	_notesPopover = [[UIPopoverController alloc] initWithContentViewController:_noteNav];
	[_notesPopover presentPopoverFromBarButtonItem:_notes permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	_notesPopover.passthroughViews = [[NSArray alloc] init];
	_notesPopover.delegate = self;
	
	noteViewController.popover = _notesPopover;
}

//Used to add note to stage when the note popover is dismissed
-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
	// TODO: Adding notes to screen from frame needs to be fixed here.
	if ([popoverController isEqual:_notesPopover]) {
		Scene* current = [_production.scenes objectAtIndex:0];
		Frame* curFrame = [current.frames objectAtIndex:current.curFrame];
		[self contentView].noteLabel.text = curFrame.note;
		UIPanGestureRecognizer * noteMover = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureMoveAround:)];
		[noteMover setDelegate:self];
		[[self contentView].noteLabel setUserInteractionEnabled:YES];
		[[self contentView].noteLabel addGestureRecognizer:noteMover];
		[[self contentView].noteLabel sizeToFit];
	}
	
	[[self view] setNeedsDisplay];
}

// Popover for adding set pieces to the stage
-(void)setPiecesPopover{
	UITableViewController* setViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
	
	//NOTE: Should probably create a strings.plist file for easy string updating.
	setViewController.title = @"Set Pieces";
	
	_setNav = [[UINavigationController alloc] initWithRootViewController:setViewController];
	
	_setTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 216) style:UITableViewStyleGrouped];
	setViewController.view = _setTable;
	
	_setTable.dataSource = self;
	_setTable.delegate = self;
	
	setViewController.contentSizeForViewInPopover = CGSizeMake(320, 550);
	
	_setPopover = [[UIPopoverController alloc] initWithContentViewController:_setNav];
	[_setPopover presentPopoverFromBarButtonItem:_setPieces permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	_setPopover.passthroughViews= [[ NSArray alloc] init];
	
}

// Popover for adding performers to the stage.
-(void) performerPopoverAction{
	UITableViewController* performerViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
	
	performerViewController.title = @"Performers";
	
	_performerNav = [[UINavigationController alloc] initWithRootViewController:performerViewController];
	
	_performerTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 216) style:UITableViewStylePlain];
	performerViewController.view = _performerTable;
	
	_performerTable.dataSource = self;
	_performerTable.delegate   = self;
	
	performerViewController.contentSizeForViewInPopover = CGSizeMake(280, 90);
	_performerPopover = [[UIPopoverController alloc] initWithContentViewController:_performerNav];
	[_performerPopover presentPopoverFromBarButtonItem:_performers permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	
	_performerPopover.passthroughViews= [[ NSArray alloc] init];
	
}

// View options Popover, grid lines, opacity, etc.
- (void)viewPopoverAction{
	UITableViewController* viewViewController = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
	
	viewViewController.title = @"View";
	//this is where we enable or disable certain stage options for the stage view
	
	_container = [[UINavigationController alloc] initWithRootViewController:viewViewController];
	
	_viewTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 216) style:UITableViewStyleGrouped];
	viewViewController.view = _viewTable;
	
	_viewTable.dataSource = self;
	_viewTable.delegate   = self;
	
	viewViewController.contentSizeForViewInPopover = CGSizeMake(320, 460);
	_viewPopover = [[UIPopoverController alloc] initWithContentViewController:_container];
	[_viewPopover presentPopoverFromBarButtonItem:_viewButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	_viewPopover.passthroughViews= [[ NSArray alloc] init];
	
	
}

// UITableView Datasource for view Popover
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	NSInteger row = [indexPath row];
	NSInteger section = [indexPath section];
	
	UITableViewCell* cell ;
	if ([tableView isEqual:_viewTable]) {
		
		// View options for display in View popover.
		switch (section) {
			case 0:
				cell =   [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuse"];
				switch (row) {
					case 0:
					{
						// Switch for grid on stage
						cell.textLabel.text = @"Grid View";
						UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
						[switchview addTarget:self action:@selector(gridSwitch) forControlEvents:UIControlEventValueChanged];
						[switchview setOn:[self contentView].grid animated:NO];
						
						cell.accessoryView = switchview;
						
					}
						break;
						//could include more options here if needed
					case 1:
					{
						cell.textLabel.text= @"Grid Options";
						cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
					}
						break;
						
					default:
						break;
				}
				break;
				
			case 1:
			{
				cell =   [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
				cell.textLabel.text = @"Traffic Patterns";
				cell.textLabel.textColor = [UIColor grayColor];
				cell.textLabel.textAlignment = UITextAlignmentCenter;
			}
				break;
			case 2:
			{
				cell =   [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
				cell.textLabel.text = @"Names";
				cell.textLabel.textColor = [UIColor grayColor];
				cell.textLabel.textAlignment = UITextAlignmentCenter;
			}
				break;
			case 3:
			{
				cell =   [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
				cell.textLabel.text = @"Notes";
				cell.textLabel.textColor=[UIColor grayColor];
				cell.textLabel.textAlignment = UITextAlignmentCenter;
			}
				break;
			case 4:
			{
				cell =   [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
				cell.textLabel.text = @"Ruler";
				cell.textLabel.textColor = [UIColor grayColor];
				cell.textLabel.textAlignment = UITextAlignmentCenter;
			}
				break;
			case 5:
			{
				cell =   [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
				cell.textLabel.text = @"Audience View";
				cell.textLabel.textColor = [UIColor grayColor];
				cell.textLabel.textAlignment = UITextAlignmentCenter;
			}
				break;
				
			default:
				cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
				break;
		}
		
		return cell;
	}
	
	// Grid options cells, ie how can I adjust the grid that is displayed.
	else if( [tableView isEqual:_gridOptionsTable]){
		
		switch (section) {
				
			case 0:
			{
				cell =   [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuse"];
				switch (row) {
					case 0:
					{
						cell.textLabel.text = @"Spacing";
						cell.detailTextLabel.text = @"1";
						
					}
						break;
						
					case 1:
					{
						cell.textLabel.text= @"Measurement";
						cell.detailTextLabel.text = @"Feet";
						cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
					}
						break;
						
					case 2:
					{
						cell.textLabel.text= @"Grid Type";
						if ([self contentView].horizontalGrid) {
							
							if([self contentView].verticalGrid){
								cell.detailTextLabel.text = @"Full";
							}
							else{
								cell.detailTextLabel.text = @"Horizontal";
							}
						}
						else{
							cell.detailTextLabel.text = @"Vertical";
						}
						
						
						
						cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
					}
						break;
						
					default:
						break;
				}
			}
				break;
				
			case 1:
			{
				// Opacity Slider Cell
				cell =   [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuse"];
				_opacitySlider = [[UISlider alloc] init];
				_opacitySlider.bounds = CGRectMake(0, 0, cell.contentView.bounds.size.width - 95, _opacitySlider.bounds.size.height);
				_opacitySlider.center = CGPointMake(CGRectGetMidX(cell.contentView.bounds), CGRectGetMidY(cell.contentView.bounds));
				_opacitySlider.value = [self contentView].opacity;
				_opacitySlider.maximumValue = 1.0;
				_opacitySlider.minimumValue = 0.0;
				[cell addSubview: _opacitySlider];
				
				[_opacitySlider addTarget:self action:@selector(opacityChange) forControlEvents:UIControlEventValueChanged];
				
				// Min value label
				UILabel* minValue = [[UILabel alloc] initWithFrame:CGRectMake(20, 7,30, 25)];
				minValue.text = @"0.0";
				minValue.textColor = cell.detailTextLabel.textColor;
				[cell addSubview:minValue];
				
				//Max value label
				UILabel* maxValue = [[UILabel alloc] initWithFrame:CGRectMake(275, 7, 30, 25)];
				maxValue.text=@"1.0";
				maxValue.textColor = cell.detailTextLabel.textColor;
				[cell addSubview:maxValue];
				
			}
				break;
				
			default:
				cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
				cell.textLabel.text = @"default";
				break;
				
		}
		return cell;
	}
	// Table to contain all of the performers, used a gridTableViewCell to do display
	else if([tableView isEqual:_performerTable]){
		GridTableViewCell* gridCell;
		//need to look at frame object and edit if necessary? that's what is going to be saved on timeline
		Scene* current = [_production.scenes objectAtIndex:0];
		Frame* frame = [current.frames objectAtIndex:current.curFrame];
		gridCell = [[GridTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"gridReuse"];
		
		// Number of people not on the stage.
		NSInteger benchwarmers = [_group.performers count] - [frame.actorsOnStage count];
		
		// The following statements determine which grid cells should filled.
		if(row*3 < benchwarmers){
			Performer* performer  = [_group.performers objectAtIndex:row*3 ];
			UIImageView* performerView = [[UIImageView alloc] initWithImage: performer.icon];
			[performer addTarget:self action:@selector(panGestureMoveAround:)];
			[performer setDelegate:self];
			[gridCell.cell1 addSubview:performerView];
			[gridCell.cell1 setUserInteractionEnabled:YES];
			[gridCell.cell1 addGestureRecognizer:performer];
			
		}
		
		if(row*3 +1 < benchwarmers){
			Performer* performer2 = [_group.performers objectAtIndex:row*3 + 1];
			UIImageView* performerView2 = [[UIImageView alloc] initWithImage:performer2.icon];
			[performer2 addTarget:self action:@selector(panGestureMoveAround:)];
			[performer2 setDelegate:self];
			[gridCell.cell2 addSubview:performerView2];
			[gridCell.cell2 setUserInteractionEnabled:YES];
			[gridCell.cell2 addGestureRecognizer:performer2];
			
		}
		
		if(row*3+2 < benchwarmers){
			Performer* performer3 = [_group.performers objectAtIndex:row*3 + 2];
			UIImageView* performerView3 = [[UIImageView alloc] initWithImage:performer3.icon];
			[performer3 addTarget:self action:@selector(panGestureMoveAround:)];
			[performer3 setDelegate:self];
			[gridCell.cell3 addSubview:performerView3];
			[gridCell.cell3 setUserInteractionEnabled:YES];
			[gridCell.cell3 addGestureRecognizer:performer3];
		}
		return gridCell;
	}
	// Table containing options for altering the set of the stage
	else if([tableView isEqual:_setTable]){
		cell =   [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuse"];
		
		switch (section) {
			case 0:
			{
				cell.textLabel.text = @"Spike Tape";
				UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
				[switchview addTarget:self action:@selector(spikeTape) forControlEvents:UIControlEventValueChanged];
				[switchview setOn:[self contentView].spikeTape animated:NO];
				
				cell.accessoryView = switchview;
			}
				break;
				
			case 1:{
				
				switch (row) {
					case 0:
						cell.textLabel.text = @"Save Current Layout";
						break;
						
					case 1:
						cell.textLabel.text = @"Layout Presets";
						_layoutPresetFrame = cell.frame;
						break;
						
					default:
						break;
				}
			}
				break;
				
			case 2:{
				cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
				cell.textLabel.textColor = [UIColor grayColor];
				switch(row){
					case 0:
						cell.textLabel.text = @"All";
						break;
						
					case 1:
						cell.textLabel.text = @"Plants";
						break;
						
					case 2:
						cell.textLabel.text = @"Stairs";
						break;
						
					case 3:
						cell.textLabel.text = @"Platforms";
						break;
						
					case 4:
						cell.textLabel.text = @"Risers";
						break;
						
					case 5:
						cell.textLabel.text = @"Uncategorized";
						break;
						
					default:
						break;
				}
			}
				break;
				
			default:
				break;
		}
		return cell;
	}
	
	// Table for timeline
	else if([tableView isEqual: _timeline]){
		cell =   [[TimeLineViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuse"];
		Scene* current = [_production.scenes objectAtIndex:0];
		Frame* frame= [current.frames objectAtIndex:indexPath.row];
		cell.backgroundColor = [ UIColor colorWithPatternImage:frame.frameIcon];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		return cell;
	}
	
	else{
		return cell;
	}
	
	
}
// Set height for tables
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	CGFloat height = 50.0;
	if([tableView isEqual:_performerTable]){
		height = 90.0;
	}
	else if( [tableView isEqual:_timeline]){
		height = 68.0f;
	}
	return height;
}

// Determines the number of rows in a section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	NSInteger rows =0;
	Scene* current = [_production.scenes objectAtIndex:0];
	
	if([tableView isEqual: _timeline]){
		rows = [current.frames count];
	}
	
	else  if([tableView isEqual:_viewTable]){
		if (section ==0) {
			rows = 2;
		}
		else if (section <6)
			rows = 1;
	}
	
	
	else if( [tableView isEqual:_gridOptionsTable]){
		if (section == 0) {
			rows = 3;
		}
		else if(section ==1)
			rows =1;
	}
	
	else if( [tableView isEqual:_performerTable]){
		
		Frame* curFrame = [current.frames objectAtIndex:current.curFrame];
		float benchwarmers = [_group.performers count] - [curFrame.actorsOnStage count];
		rows = ceil(benchwarmers/3.0f);
	}
	
	else if( [tableView isEqual:_setTable]){
		switch (section) {
			case 0:
				rows =1;
				break;
				
			case 1:
				rows =2;
				break;
				
			case 2:
				rows = 6;
				break;
				
			default:
				break;
		}
	}
	
	
	return rows;
}

// Determines the number of sections for a table
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	NSInteger sections = 1;
	if([tableView isEqual:_viewTable]){
		sections = 6;
	}
	
	if( [tableView isEqual:_gridOptionsTable]){
		sections = 2;
	}
	
	if( [tableView isEqual:_performerTable]){
		sections = 1;
	}
	
	if( [tableView isEqual:_setTable])
		sections = 3;
	
	return sections;
}

// How to repsond to the row that got selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	NSInteger section = [indexPath section];
	NSInteger row = [indexPath row];
	
	if ([tableView isEqual:_viewTable]) {
		if(section ==0 && row == 1){
			// Push Grid options view onto nav controller to allow user to change grid appearance
			//if you select something, this is how the view responds
			UITableViewController* gridOptionsViewController = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
			
			gridOptionsViewController.title = @"Grid Options";
			
			_gridOptionsTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 500) style:UITableViewStyleGrouped];
			gridOptionsViewController.view = _gridOptionsTable;
			
			_gridOptionsTable.dataSource = self;
			_gridOptionsTable.delegate   = self;
			
			gridOptionsViewController.contentSizeForViewInPopover = CGSizeMake(320, 460);
			[_container pushViewController:gridOptionsViewController animated:YES];
			_viewPopover.popoverContentSize = CGSizeMake(320, 500);
			
			
		}
	}
	
	else if ([tableView isEqual:_setTable]){
		switch (indexPath.section) {
			case 1:
			{
				switch (indexPath.row) {
					case 0:{
						// Save current Layout as a preset, present alert to ask for name of layout.
						UIAlertView* saveAlert =  [[UIAlertView alloc ]initWithTitle:@"Save Layout"
																			 message:@"Please enter a name for the layout"
																			delegate:self
																   cancelButtonTitle:@"Cancel"
																   otherButtonTitles:@"Save",nil];
						saveAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
						[saveAlert show];
						saveAlert.delegate = self;
					}
						break;
						
					case 1:{
						UIViewController* layoutViewController = [[UIViewController alloc] init];
						
						_layoutSelector = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
						UIView* wrapper = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320,216)];
						[wrapper addSubview:_layoutSelector];
						layoutViewController.view = wrapper;
						_layoutSelector.dataSource = self;
						_layoutSelector.delegate   = self;
						_layoutSelector.showsSelectionIndicator = YES;
						
						_layoutPopover = [[UIPopoverController alloc] initWithContentViewController:layoutViewController];
						[_layoutPopover setPopoverContentSize:CGSizeMake(320,216)];
						[_layoutPopover presentPopoverFromRect:_layoutPresetFrame
														inView:_setPopover.contentViewController.view
									  permittedArrowDirections:UIPopoverArrowDirectionAny
													  animated:YES];
						
					}
						break;
						
					default:
						break;
				}
			}
				break;
				
			default:
				break;
		}
	}
	
	/*THIS NEEDS TO BE TOUCHED UP / FINISHED*/
	else if([tableView isEqual:_gridOptionsTable]){
		if(section == 0){
			switch (row) {
				case 0:
				{
					//need to implement what happens if you push grid options ?
				}
					break;
				case 1:
				{
					
				}
					break;
				case 2:
				{
					_gridSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Horizontal Grid", @"Vertical Grid", @"Full Grid" , nil];
					
					//UITableViewCell * cell = [_gridOptionsTable cellForRowAtIndexPath:indexPath];
					[_gridSheet showFromRect:CGRectMake(150, 70, 200, 200) inView:_container.view animated:YES];
					
				}
					
				default:
					break;
			}
			
		}
	}
	
	//this is all of the timeline logic.
	
	else if( [tableView isEqual:_timeline]){
		_production.curFrame = indexPath.row;
		Frame* frame = [_production.frames objectAtIndex:indexPath.row];
		// TODO: Need to fix the way that actors are put on stage with positions.
		//puts performers in their positions
		for( Performer* p in _group.performers){
			NSString* key = [NSString stringWithFormat:@"%d",p.uniqueID.intValue];
			Position* pos = [frame.performerPositions objectForKey:key];
			
			if(pos != nil){
				[ [[UIApplication sharedApplication] keyWindow] addSubview:p.view ]; //adds sep view per performer?
				[p.view setCenter:CGPointMake(pos.x, pos.y)];
				[p.view setNeedsDisplay];
			}
			else{
				
				[p.view removeFromSuperview];
				
			}
		}
		
		[self contentView].noteLabel.text =frame.note;
		CGRect locationFrame = [self contentView].noteLabel.frame ;
		[self contentView].noteLabel.frame = CGRectMake(locationFrame.origin.x, locationFrame.origin.y, 150, 50);
		[[self contentView].noteLabel sizeToFit];
		
		[self contentView].myPath = frame.spikePath;
		[[[UIApplication sharedApplication] keyWindow] setNeedsDisplay];
	}
	
}

// Alert View delegate
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	
	if (buttonIndex == 0) {
		
	}
	else{
		UIBezierPath* path = [UIBezierPath bezierPathWithCGPath:[self contentView].myPath.CGPath];
		path.lineCapStyle=kCGLineCapRound;
		path.miterLimit=0;
		path.lineWidth=5;
		NSString* name = [alertView textFieldAtIndex:0].text;
		[_production.layouts setObject:path forKey:name];
	}
	
}


// Action sheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
	if([actionSheet isEqual:_gridSheet]){
		
		switch (buttonIndex) {
			case 0:
			{
				[self contentView].horizontalGrid = YES;
				[self contentView].verticalGrid = NO;
			}
				break;
			case 1:
			{
				[self contentView].horizontalGrid = NO;
				[self contentView].verticalGrid = YES;
			}
				break;
			case 2:
			{
				[self contentView].horizontalGrid = YES;
				[self contentView].verticalGrid = YES;
			}
				
			default:
				break;
		}
		
		[[self contentView] setNeedsDisplay];
		[_gridOptionsTable reloadData];
	}
	else if ([actionSheet isEqual:_productionSheet]){
		Frame* newFrame = [[Frame alloc] init];
		[self contentView].noteLabel.text = @"";
		switch (buttonIndex) {
				
				//'CREATE NEW FRAME' BUTTON
			case 0:{
				Scene* current = [_production.scenes objectAtIndex:0];
				Frame* curFrame = [_production.frames objectAtIndex:_production.curFrame];
				Frame* newFrame = [[Frame alloc]init];
				newFrame.spikePath = [UIBezierPath bezierPathWithCGPath:curFrame.spikePath.CGPath];
				newFrame.spikePath.lineCapStyle = kCGLineCapRound;
				newFrame.spikePath.miterLimit = 0;
				newFrame.spikePath.lineWidth =5 ;
				_production.curFrame = _production.curFrame +1;
				[_production.frames insertObject:newFrame atIndex:_production.curFrame ];
				[self contentView].myPath = newFrame.spikePath;
				[[[UIApplication sharedApplication] keyWindow]  setNeedsDisplay];
				[self saveIcon];
                
			}
				break;
			case 1:{
				//'COPY PREVIOUS FRAME BUTTON
				Frame* curFrame = [_production.frames objectAtIndex:_production.curFrame];
				
				for( Performer* p in _group.performers){
					NSString* key = [NSString stringWithFormat:@"%d",p.uniqueID.intValue];
					Position* pos = [curFrame.performerPositions objectForKey:key];
					
					if(pos != nil){
						[p.view removeFromSuperview];
					}
				}
				
				[self contentView].myPath = [[UIBezierPath alloc] init];
				[self contentView].myPath.lineCapStyle=kCGLineCapRound;
				[self contentView].myPath.miterLimit=0;
				[self contentView].myPath.lineWidth=5;
				
				_production.curFrame = _production.curFrame +1;
				[_production.frames insertObject:newFrame atIndex:_production.curFrame ];
				[[[UIApplication sharedApplication] keyWindow]  setNeedsDisplay];
				[self saveIcon];
			}
				
			default:
				break;
		}
		
		
		
	}
	
}


// Titles for Sections
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	NSString* title = @"";
	//need to add more if conditions for other tables?
	if([tableView isEqual:_gridOptionsTable]){
		if (section ==1) {
			title = @"Opacity";
		}
	}
	
	if([tableView isEqual:_setTable]){
		if (section == 2) {
			title = @"Set Pieces";
		}
	}
	
	return title;
}

-(void)spikeTape{
	if([self contentView].spikeTape)
		[self contentView].spikeTape = NO;
	else
		[self contentView].spikeTape = YES;
	
	[[self contentView] setNeedsDisplay];
}
-(void)gridSwitch{
	
	if([self contentView].grid)
		[self contentView].grid = NO;
	else
		[self contentView].grid = YES;
	
	[[self contentView] setNeedsDisplay];
}

-(void)opacityChange{
	[self contentView].opacity = _opacitySlider.value;
	[[self contentView] setNeedsDisplay];
}

- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
	if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
		UIView *piece = gestureRecognizer.view;
		CGPoint locationInView = [gestureRecognizer locationInView:piece];
		CGPoint locationInSuperview = [gestureRecognizer locationInView:[[UIApplication sharedApplication] keyWindow].inputView];
		[[[UIApplication sharedApplication] keyWindow] addSubview:piece];
		[[[UIApplication sharedApplication] keyWindow] bringSubviewToFront:piece];
		piece.transform = CGAffineTransformMakeRotation(M_PI+M_PI_2);
		
		piece.layer.anchorPoint = CGPointMake( locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
		piece.center = locationInSuperview;
	}
}

-(void)panGestureMoveAround:(UIPanGestureRecognizer*) gesture;
{
	
	UIView *piece = [gesture view];
	
	//We pass in the gesture to a method that will help us align our touches so that the pan and pinch will seems to originate between the fingers instead of other points or center point of the UIView
	[self adjustAnchorPointForGestureRecognizer:gesture];
	
	if (/*[gesture state] == UIGestureRecognizerStateBegan || */[gesture state] == UIGestureRecognizerStateChanged) {
		
		CGPoint translation = [gesture translationInView:[piece superview]];
		[piece setCenter:CGPointMake([piece center].x + lroundf(translation.x), [piece center].y+lroundf(translation.y))];
		[gesture setTranslation:CGPointZero inView:[piece superview]];
	}else if( [gesture state] == UIGestureRecognizerStateEnded)
	{
		//Put the code that you may want to execute when the UIView became larger than certain value or just to reset them back to their original transform scale
		
		if([gesture isMemberOfClass:[Performer class]]){
			
			Performer * performer = (Performer*) gesture;
			
			NSString* key = [NSString stringWithFormat:@"%d",performer.uniqueID.intValue];
			Frame* frame = [_production.frames objectAtIndex:_production.curFrame];
			Position* pos =  [frame.performerPositions objectForKey:key];
			if( pos == nil){
				pos = [[Position alloc] init];
				pos.x = [piece center].x;
				pos.y = [piece center].y;
				
				[frame.performerPositions setValue:pos forKey:key];
				if( ![frame.performersOnStage containsObject:performer])
					[frame.performersOnStage addObject:performer];
			}
			else{
				pos.x = [piece center].x;
				pos.y = [piece center].y;
			}
		}
	}
}

-(void)saveIcon{
	UIView* wholeScreen = [[UIApplication sharedApplication] keyWindow];
	// Screen Shot
	UIGraphicsBeginImageContext([wholeScreen bounds].size);
	[wholeScreen.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *fullImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	//Thumbnail
	UIGraphicsBeginImageContext(CGSizeMake(50, 70));
	[fullImage drawInRect:CGRectMake(0,0,50, 70)];
	UIImage *iconImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	//Rotate to deal with horizontal scroll
	UIImage* rotImage = [self image:iconImage RotatedByDegrees:180.0f];
	
	Frame* frame = [_production.frames objectAtIndex:_production.curFrame];
	
	frame.frameIcon = rotImage;
	frame.spikePath = [self contentView].myPath;
	[_timeline reloadData];
	
	NSIndexPath *ip=[NSIndexPath indexPathForRow:_production.curFrame inSection:0];
	[_timeline selectRowAtIndexPath:ip animated:NO scrollPosition:UITableViewScrollPositionBottom];
	
	
}

- (UIImage *)image:(UIImage*)image RotatedByDegrees:(CGFloat)degrees
{
	// calculate the size of the rotated view's containing box for our drawing space
	UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,image.size.width, image.size.height)];
	CGAffineTransform t = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degrees));
	rotatedViewBox.transform = t;
	CGSize rotatedSize = rotatedViewBox.frame.size;
	
	// Create the bitmap context
	UIGraphicsBeginImageContext(rotatedSize);
	CGContextRef bitmap = UIGraphicsGetCurrentContext();
	
	// Move the origin to the middle of the image so we will rotate and scale around the center.
	CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
	
	//   // Rotate the image context
	CGContextRotateCTM(bitmap, DEGREES_TO_RADIANS(degrees));
	
	// Now, draw the rotated/scaled image into the context
	CGContextScaleCTM(bitmap, 1.0, -1.0);
	CGContextDrawImage(bitmap, CGRectMake(-image.size.width / 2, -image.size.height / 2, image.size.width, image.size.height), [image CGImage]);
	
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
	
}


-(void)backToSplit{
	AppDelegate *mainDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
	
	[mainDelegate toggleEditViewWithGroup:_group];
	
}

- (void)productionOptionsAS{
	_productionSheet = [[UIActionSheet alloc] initWithTitle:@"Production" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Copy Previous Frame", @"New Frame", nil];
	
	[_productionSheet showFromRect:_productionOptions.frame inView:self.view animated:YES];
	
}

//UIPickerViewDelegate Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	
	return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	NSArray* keys = [_production.layouts allKeys];
	
	return [keys count];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
	return 25.0;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
	return 275.0;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	NSArray* keys = [_production.layouts allKeys];
	return [keys objectAtIndex:row];
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	NSArray* keys = [_production.layouts allKeys];
	NSString* key = [keys objectAtIndex:row];
	
	[self contentView].myPath = [_production.layouts objectForKey:key];
	
	[[self view] setNeedsDisplay];
	
}


@end

//
//  AddMemberViewController.m
//  BlockLight
//
//  Created by Barrett Ames on 8/22/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "AddMemberViewController.h"
#import "AppDelegate.h"
@interface AddMemberViewController ()

@end


@implementation AddMemberViewController

@synthesize popover = _popover;
@synthesize group = _filterGroup;
@synthesize groupTable = _groupTable;
@synthesize contactTable = _contactTable; 


- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
      CreateMemberView* createMember = [[CreateMemberView alloc] initWithFrame:CGRectZero];
      self.view = createMember;
      self.title = @"Add A Member";
      UIBarButtonItem* save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                            target:self
                                                                            action:@selector(saveMember)];
      save.tintColor = [UIColor blueColor];
      
      self.navigationItem.rightBarButtonItem=save;
    }
    return self;
}

-(CreateMemberView*) contentView{
  return (CreateMemberView*) self.view;
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

-(void)saveMember{

  AppDelegate *mainDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
  
  Performer* newPerformer = [[Performer alloc] init];
  newPerformer.name = [self contentView].name.text;
  newPerformer.voice = [self contentView].voice.text;
  newPerformer.role = [self contentView].role.text;
  newPerformer.gender = [self contentView].role.text; 
  newPerformer.stagePresence = [self contentView].stage.text;
  newPerformer.notes = [self contentView].notes.text; 
  newPerformer.phoneNumber = [self contentView].phone.text;
  newPerformer.email = [self contentView].email.text;
  newPerformer.height = [self contentView].height.text; 
  newPerformer.uniqueID = mainDelegate.userData.nextUniquePerformerID;
  
  [_filterGroup.performers addObject:newPerformer]; 
    
  [_groupTable reloadData];
  [_contactTable reloadData];
  
  [_popover dismissPopoverAnimated:YES];
  
  
}

@end

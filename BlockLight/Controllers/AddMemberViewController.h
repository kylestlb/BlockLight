//
//  AddMemberViewController.h
//  BlockLight
//
//  Created by Barrett Ames on 8/22/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateMemberView.h"
#import "Performer.h"
#import "Group.h"
@interface AddMemberViewController : UIViewController{
  UIPopoverController* _popover;
  Group* _filterGroup;
  UITableView* _groupTable;
  UITableView* _contactTable; 

}

@property UIPopoverController* popover;
@property Group* group;
@property UITableView* contactTable;
@property UITableView* groupTable; 

-(void)saveMember; 
@end

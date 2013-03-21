//
//  ContactsViewController.h
//  BlockLight
//
//  Created by Barrett Ames on 8/16/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeDetailViewCell.h"
#import "ContactsView.h"
#import "CreateGroupView.h"
#import "AddGroupViewController.h"
#import "AddMemberViewController.h"
#import "performerCell.h"

@interface ContactsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>{
  
  UIPopoverController* _groupPopover;
  UIPopoverController* _addGroupPopover;
  UIPopoverController* _addMemberPopover;
  UITableView* _groupTable;
  UITableView* _contactTable;
  UIPickerView* _groupSelector; 
  Group* _filterGroup;

}

-(void)filterBy;
-(void)addGroupPopover;
-(void)addMemberPopover; 
@end

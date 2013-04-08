//
//  AddGroupViewController.h
//  BlockLight
//
//  Created by Barrett Ames on 8/21/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateGroupView.h"
#import "AppDelegate.h"
#import "Group.h"
#import "CreateGroupView.h"

@interface AddGroupViewController : UIViewController <UINavigationControllerDelegate>
{
    UIPopoverController* _popover;
    UITableView* _table;
    UIPickerView* _picker;
}

@property UIPopoverController* popover;
@property UITableView* table;
@property UIPickerView* picker;

-(void)saveGroup;

@end

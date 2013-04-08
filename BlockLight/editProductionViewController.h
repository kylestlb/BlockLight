//
//  editProductionViewController.h
//  BlockLight
//
//  Created by Jordan Nguyen on 4/4/13.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeDetailViewCell.h"
#import "editProductionView.h"
#import "AddMemberViewController.h"
#import "performerCell.h"

@interface editProductionViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UIPopoverController* _addMemberPopover;
    UITableView* _contactTable;
    Group* _filterGroup;
}

//-(void)saveProductionInfo;
//-(void)goToStage;
-(void)addMemberPopover;

@end

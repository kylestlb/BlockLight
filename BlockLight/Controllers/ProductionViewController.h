//
//  ProductionViewController.h
//  BlockLight
//
//  Created by Barrett Ames on 8/14/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ProductionViewCell.h"
#import "homeMasterViewController.h"
#import "editProductionViewController.h"
#import "AppDelegate.h"
#import "Group.h"
#import "AddPerformanceViewController.h"

@interface ProductionViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    Group* _group;
    UIPopoverController* _addPerformancePopover;
    UIButton* _createProduction;
    UITableView* _performanceTable;
}

- (id)initWithGroup:(Group*)group;
- (void)createProduction;

@end

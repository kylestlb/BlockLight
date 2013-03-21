//
//  AddPerformanceViewController.h
//  BlockLight
//
//  Created by Barrett Ames on 8/29/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreatePerformance.h"
#import "Production.h"
#import "Group.h"
@interface AddPerformanceViewController : UIViewController{
  Group* _group;
  UITableView* _performanceTable;
  UIPopoverController* _performancePopover; 
}

@property (strong) UITableView* performanceTable;
@property (strong) UIPopoverController* performancePopover; 
- (id)initWithGroup:(Group*)group; 
@end

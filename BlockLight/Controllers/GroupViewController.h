//
//  GroupViewController.h
//  BlockLight
//
//  Created by Barrett Ames on 8/6/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupViewCell.h"
#import "ProductionViewController.h"
#import "homeMasterViewController.h"


@interface GroupViewController : UIViewController <UISplitViewControllerDelegate,UITableViewDataSource, UITableViewDelegate>{
  UITableView* _table;
}

@end

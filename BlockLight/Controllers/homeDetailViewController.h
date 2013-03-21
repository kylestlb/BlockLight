//
//  homeDetailViewController.h
//  BlockLight
//
//  Created by Barrett Ames on 8/6/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeDetailViewCell.h"
#import "GroupViewController.h"
#import "homeMasterViewController.h"


@interface homeDetailViewController : UIViewController <UISplitViewControllerDelegate,UITableViewDataSource, UITableViewDelegate>{
  UITableView* _table;
}

@end

//
//  DimensionsViewController.h
//  BlockLight
//
//  Created by Barrett Ames on 7/30/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DimensionsView.h"
//connect to productions and Groups
#import "Production.h"
#import "Group.h"
#import "MainStageViewController.h"

@interface DimensionsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
  UIPopoverController* _presetPopover; 
}

@end

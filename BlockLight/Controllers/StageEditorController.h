//
//  StageEditorController.h
//  BlockLight
//
//  Created by Barrett Ames on 7/30/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageEditor.h"
//connect to productions and Groups
#import "Production.h"
#import "Group.h"
#import "MainViewController.h"

@interface StageEditorController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
  UIPopoverController* _presetPopover; 
}

@end

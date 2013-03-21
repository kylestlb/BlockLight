//
//  StageEditorController.h
//  BlockLight
//
//  Created by Barrett Ames on 7/30/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageEditor.h"

@interface StageEditorController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
  UIPopoverController* _presetPopover; 
}

@end

//
//  SetPieceTableDelegate.h
//  BlockLight
//
//  Created by Barrett Ames on 9/17/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainViewController.h"
#import "MainView.h" 

@interface SetPieceTableDelegate : NSObject <UIPickerViewDelegate, UIPickerViewDataSource,UITableViewDataSource, UITableViewDelegate>{
  
  MainViewController* _mainViewController;
  CGRect _layoutPresetFrame;
  UIPickerView* _layoutSelector;
  UIPopoverController* _layoutPopover;

}
-(id)initWithViewController:(MainViewController*)mainViewController; 

@end

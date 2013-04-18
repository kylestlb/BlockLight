//
//  MainViewController.h
//  BlockLight
//
//  NOTE: This needs to be refactored for several reasons, mostly due to the length creating an overly difficult file to navigate #pragmas may also
//  help with navigation. The length is due largely to the complexity and number of the actions that take place in this view.
//
//  This file contains all of the controller code for the main view of the stage.
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DimensionsViewController.h"
#import "GridTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "Production.h"
#import "Group.h"
#import "Frame.h"
#define M_PI   3.14159265358979323846264338327950288
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)
#import "Position.h"
#import "NoteViewController.h"
#import "TimeLineViewCell.h"

@interface DummyMainViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UIAlertViewDelegate, UITableViewDelegate, UIPopoverControllerDelegate,UITableViewDataSource,UIActionSheetDelegate,UIGestureRecognizerDelegate>{
	UIPopoverController* _viewPopover;
	UIPopoverController* _performerPopover;
	UIPopoverController* _setPopover;
	UIPopoverController* _notesPopover;
	UIPopoverController* _layoutPopover;
	UIBarButtonItem* _viewButton;
	UIBarButtonItem* _performers;
	UIBarButtonItem* _setPieces;
	UIBarButtonItem* _notes;
	UITableView* _viewTable;
	UITableView* _performerTable;
	UITableView* _setTable;
	UITableView* _gridOptionsTable;
	UINavigationController* _container;
	UINavigationController* _performerNav;
	UINavigationController* _setNav;
	UINavigationController* _noteNav;
	UIActionSheet* _gridSheet;
	UIActionSheet* _productionSheet;
	UISlider* _opacitySlider;
	UIPanGestureRecognizer * _panGesture;
	UITableView* _timeline;
	Production* _production;
	Group*  _group;
	NSInteger _currentFrame;
	UIButton* _productionOptions;
	UIPickerView* _layoutSelector;
	CGRect _layoutPresetFrame;
	
}
//- (id)initWithProduction:(Production*)production andGroup:(Group*)group;
- (void)productionOptionsAS;

@property (strong) UIPopoverController* viewPopover;
@property (strong) UIPopoverController* performerPopover;
@property (strong) UIPopoverController* setPopover;

@end

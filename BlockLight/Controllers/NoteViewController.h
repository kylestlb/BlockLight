//
//  NoteViewController.h
//  BlockLight
//
//  Created by Barrett Ames on 9/3/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteView.h"
#import "Frame.h"
@interface NoteViewController : UIViewController{
  Frame* _frame;
  UIPopoverController* _popover; 
}
-(void)addNoteView;
- (id)initWithFrame:(Frame*) frame;
@property (strong) UIPopoverController* popover;

@end

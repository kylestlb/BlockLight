//
//  ContactsView.h
//  BlockLight
//
//  Created by Barrett Ames on 8/16/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ContactsView : UIView{
  
  UIButton* _filterBy;
  UIButton* _addGroup;
  UIButton* _editGroup;
  UIButton* _addMember;
}

@property (strong) UIButton* filterBy;
@property  (strong) UIButton* addGroup;
@property  (strong) UIButton* editGroup;
@property  (strong) UIButton* addMember; 

- (id)initWithDelegate:(id)viewController; 
@end

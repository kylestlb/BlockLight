//
//  CreatePerformance.h
//  BlockLight
//
//  Created by Barrett Ames on 8/29/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatePerformance : UIView{
  UITextField* _nameInput;
  UITextField* _locationInput;
  UITextField* _stageManagerInput;
  UITextField* _dateInput; 
}

@property (strong) UITextField* name;
@property (strong) UITextField* location;
@property (strong) UITextField* stageManager;
@property (strong) UITextField* date; 

@end

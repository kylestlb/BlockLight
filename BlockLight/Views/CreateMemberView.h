//
//  CreateMemberView.h
//  BlockLight
//
//  Created by Barrett Ames on 8/22/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateMemberView : UIView{
  UITextField* _nameInput;
  UITextField* _roleInput;
  UITextField* _voiceInput;
  UITextField* _genderInput;
  UITextField* _heightInput;
  UITextField* _stageInput;
  UITextField* _notesInput;
  UITextField* _phoneInput;
  UITextField* _emailInput; 
}


@property (strong) UITextField* name;
@property (strong) UITextField* role;
@property (strong) UITextField* voice;
@property (strong) UITextField* gender;
@property (strong) UITextField* height;
@property (strong) UITextField* stage;
@property (strong) UITextField* notes;
@property (strong) UITextField* phone;
@property (strong) UITextField* email;

@end

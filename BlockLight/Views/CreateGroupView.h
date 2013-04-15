//
//  CreateGroupView.h
//  BlockLight
//
//  Created by Barrett Ames on 8/21/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateGroupView : UIView{
  
  UITextField* _nameInput;
  UITextField* _typeInput;
}

@property (strong) UITextField* name;
@property (strong) UITextField* type; 


@end

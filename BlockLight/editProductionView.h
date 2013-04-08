//
//  editProductionView.h
//  BlockLight
//
//  Created by Jordan Nguyen on 4/4/13.
//  Copyright (c) 2013 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface editProductionView : UIView
{
    UITextField* _nameInput;
    UITextField* _locationInput;
    UITextField* _stageManagerInput;
    UITextField* _dateInput;
    UIButton* _saveButton;
    UIButton* _editStageButton;
    UIButton* _addMemberButton;
}


@property (nonatomic, strong) UITextField* nameInput;
@property (nonatomic, strong) UITextField* locationInput;
@property (nonatomic, strong) UITextField* stageManagerInput;
@property (nonatomic, strong) UITextField* dateInput;
@property (nonatomic, strong) UIButton* saveButton;
@property (nonatomic, strong) UIButton* editStageButton;
@property (nonatomic, strong) UIButton* addMemberButton;


- (id)initWithDelegate:(id)viewController;

@end

//
//  editProductionView.m
//  BlockLight
//
//  Created by Jordan Nguyen on 4/4/13.
//  Copyright (c) 2013 BlockLight. All rights reserved.
//

#import "editProductionView.h"

@implementation editProductionView

@synthesize nameInput = _nameInput;
@synthesize locationInput = _locationInput;
@synthesize stageManagerInput = _stageManagerInput;
@synthesize dateInput = _dateInput;
@synthesize saveButton = _saveButton;
@synthesize editStageButton = _editStageButton;
@synthesize addMemberButton = _addMemberButton;

- (id)initWithDelegate:(id)viewController
{
    self = [super init];
    if (self)
    {
        UILabel* name = [[UILabel alloc] initWithFrame:CGRectMake(125, 70, 150, 25)];
        name.text = @"Name:";
        name.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        name.backgroundColor = [UIColor clearColor];
        name.textColor =[UIColor whiteColor];
        
        _nameInput = [[UITextField alloc] initWithFrame:CGRectMake(200, 70, 450, 25)];
        _nameInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
        _nameInput.textColor = [UIColor whiteColor];
        
        UILabel* location= [[UILabel alloc] initWithFrame:CGRectMake(103, 100, 150, 25)];
        location.text = @"Location:";
        location.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        location.backgroundColor = [UIColor clearColor];
        location.textColor =[UIColor whiteColor];
        
        _locationInput = [[UITextField alloc] initWithFrame:CGRectMake(200, 100, 450, 25)];
        _locationInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
        _locationInput.textColor = [UIColor whiteColor];
        
        UILabel* date= [[UILabel alloc] initWithFrame:CGRectMake(40, 130, 150, 25)];
        date.text = @"Production Date:";
        date.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        date.backgroundColor = [UIColor clearColor];
        date.textColor =[UIColor whiteColor];
        
        _dateInput = [[UITextField alloc] initWithFrame:CGRectMake(200, 130, 450, 25)];
        _dateInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
        _dateInput.textColor = [UIColor whiteColor];
        
        UILabel* stageManager= [[UILabel alloc] initWithFrame:CGRectMake(50, 160, 150, 25)];
        stageManager.text = @"Stage Manager:";
        stageManager.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        stageManager.backgroundColor = [UIColor clearColor];
        stageManager.textColor =[UIColor whiteColor];
        
        _stageManagerInput = [[UITextField alloc] initWithFrame:CGRectMake(200, 160, 450, 25)];
        _stageManagerInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
        _stageManagerInput.textColor = [UIColor whiteColor];

        UIView* line = [[UIView alloc] initWithFrame:CGRectMake(25, 250, 650, 2)];
        line.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.8f];
        
        _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _saveButton.frame = CGRectMake(580, 221, 100, 25);
        [_saveButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        _saveButton.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] ;
        [_saveButton setTitle:@"Save" forState:UIControlStateNormal];
        _saveButton.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:15];
        _saveButton.titleLabel.textColor = [UIColor whiteColor];
        _saveButton.layer.cornerRadius = 7.0f;
        _saveButton.layer.shadowColor = [UIColor grayColor].CGColor;
        _saveButton.layer.shadowOffset = CGSizeMake(0, 1);
        //[_saveButton addTarget:viewController action:@selector(saveProductionInfo) forControlEvents:UIControlEventTouchUpInside];
        
        _editStageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _editStageButton.frame = CGRectMake(580, 700, 100, 25);
        [_editStageButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        _editStageButton.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] ;
        [_editStageButton setTitle:@"Edit Stage" forState:UIControlStateNormal];
        _editStageButton.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:15];
        _editStageButton.titleLabel.textColor = [UIColor whiteColor];
        _editStageButton.layer.cornerRadius = 7.0f;
        _editStageButton.layer.shadowColor = [UIColor grayColor].CGColor;
        _editStageButton.layer.shadowOffset = CGSizeMake(0, 1);
        //[_editStageButton addTarget:viewController action:@selector(goToStage) forControlEvents:UIControlEventTouchUpInside];
                
        _addMemberButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addMemberButton.frame = CGRectMake(580, 257, 100, 25);
        [_addMemberButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        _addMemberButton.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] ;
        [_addMemberButton setTitle:@"Add Actor" forState:UIControlStateNormal];
        _addMemberButton.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:15];
        _addMemberButton.titleLabel.textColor = [UIColor whiteColor];
        _addMemberButton.layer.cornerRadius = 7.0f;
        _addMemberButton.layer.shadowColor = [UIColor grayColor].CGColor;
        _addMemberButton.layer.shadowOffset = CGSizeMake(0, 1);
        [_addMemberButton addTarget:viewController action:@selector(addMemberPopover) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:name];
        [self addSubview:_nameInput];
        [self addSubview:location];
        [self addSubview:_locationInput];
        [self addSubview:date];
        [self addSubview:_dateInput];
        [self addSubview:stageManager];
        [self addSubview:_stageManagerInput];
        
        [self addSubview:line];
        [self addSubview:_saveButton];
        [self addSubview:_editStageButton];
        [self addSubview:_addMemberButton];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end

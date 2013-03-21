//
//  CreateMemberView.m
//  BlockLight
//
//  Created by Barrett Ames on 8/22/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "CreateMemberView.h"

@implementation CreateMemberView

@synthesize name = _nameInput;
@synthesize role = _roleInput;
@synthesize voice = _voiceInput;
@synthesize gender = _genderInput;
@synthesize height = _heightInput;
@synthesize stage = _stageInput;
@synthesize notes = _notesInput;
@synthesize phone = _phoneInput;
@synthesize email = _emailInput; 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      UILabel* name = [[UILabel alloc] initWithFrame:CGRectMake(83, 20, 150, 25)];
      name.text = @"Name:";
      name.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      name.backgroundColor = [UIColor clearColor];
      name.textColor =[UIColor whiteColor];
      
      _nameInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 20, 210, 25)];
      _nameInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _nameInput.textColor = [UIColor whiteColor];
      
      UILabel* role= [[UILabel alloc] initWithFrame:CGRectMake(91, 50, 150, 25)];
      role.text = @"Role:";
      role.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      role.backgroundColor = [UIColor clearColor];
      role.textColor =[UIColor whiteColor];
      
      _roleInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 50, 210, 25)];
      _roleInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _roleInput.textColor = [UIColor whiteColor];
      
      UILabel* voice= [[UILabel alloc] initWithFrame:CGRectMake(83, 80, 150, 25)];
      voice.text = @"Voice:";
      voice.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      voice.backgroundColor = [UIColor clearColor];
      voice.textColor =[UIColor whiteColor];
      
      _voiceInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 80, 210, 25)];
      _voiceInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _voiceInput.textColor = [UIColor whiteColor];
      
      UILabel* gender= [[UILabel alloc] initWithFrame:CGRectMake(70, 110, 150, 25)];
      gender.text = @"Gender:";
      gender.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      gender.backgroundColor = [UIColor clearColor];
      gender.textColor =[UIColor whiteColor];
      
      _genderInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 110, 210, 25)];
      _genderInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _genderInput.textColor = [UIColor whiteColor];
      
      UILabel* height= [[UILabel alloc] initWithFrame:CGRectMake(75, 140, 150, 25)];
      height.text = @"Height:";
      height.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      height.backgroundColor = [UIColor clearColor];
      height.textColor =[UIColor whiteColor];
      
      _heightInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 140, 210, 25)];
      _heightInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _heightInput.textColor = [UIColor whiteColor];
      
      UILabel* stage= [[UILabel alloc] initWithFrame:CGRectMake(5, 170, 150, 25)];
      stage.text = @"Stage Presence:";
      stage.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      stage.backgroundColor = [UIColor clearColor];
      stage.textColor =[UIColor whiteColor];
      
      _stageInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 170, 210, 25)];
      _stageInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _stageInput.textColor = [UIColor whiteColor];
      
      UILabel* notes= [[UILabel alloc] initWithFrame:CGRectMake(80, 200, 150, 25)];
      notes.text = @"Notes:";
      notes.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      notes.backgroundColor = [UIColor clearColor];
      notes.textColor =[UIColor whiteColor];
      
      _notesInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 200, 210, 25)];
      _notesInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _notesInput.textColor = [UIColor whiteColor];
      
      UILabel* phone= [[UILabel alloc] initWithFrame:CGRectMake(75, 230, 150, 25)];
      phone.text = @"Phone:";
      phone.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      phone.backgroundColor = [UIColor clearColor];
      phone.textColor =[UIColor whiteColor];
      
      _phoneInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 230, 210, 25)];
      _phoneInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _phoneInput.textColor = [UIColor whiteColor];
      
      UILabel* email= [[UILabel alloc] initWithFrame:CGRectMake(80, 260, 150, 25)];
      email.text = @"Email:";
      email.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      email.backgroundColor = [UIColor clearColor];
      email.textColor =[UIColor whiteColor];
      
      _emailInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 260, 210, 25)];
      _emailInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _emailInput.textColor = [UIColor whiteColor];
      
      [self addSubview:name];
      [self addSubview:_nameInput];
      [self addSubview:role];
      [self addSubview:_roleInput];
      [self addSubview:voice];
      [self addSubview:_voiceInput];
      [self addSubview:gender];
      [self addSubview:_genderInput];
      [self addSubview:height];
      [self addSubview:_heightInput];
      [self addSubview:stage];
      [self addSubview:_stageInput];
      [self addSubview:notes];
      [self addSubview:_notesInput];
      [self addSubview:phone];
      [self addSubview:_phoneInput];
      [self addSubview:email];
      [self addSubview:_emailInput];
      
      
      
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

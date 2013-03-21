//
//  CreatePerformance.m
//  BlockLight
//
//  Created by Barrett Ames on 8/29/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "CreatePerformance.h"

@implementation CreatePerformance

@synthesize name = _nameInput;
@synthesize location = _locationInput;
@synthesize stageManager = _stageManagerInput;
@synthesize date = _dateInput; 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      UILabel* name = [[UILabel alloc] initWithFrame:CGRectMake(83, 20, 150, 25)];
      name.text = @"Name:";
      name.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      name.backgroundColor = [UIColor clearColor];
      name.textColor =[UIColor whiteColor];
      
      _nameInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 20, 210, 25)];
      _nameInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _nameInput.textColor = [UIColor whiteColor];
      
      UILabel* location= [[UILabel alloc] initWithFrame:CGRectMake(61, 50, 150, 25)];
      location.text = @"Location:";
      location.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      location.backgroundColor = [UIColor clearColor];
      location.textColor =[UIColor whiteColor];
      
      _locationInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 50, 210, 25)];
      _locationInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _locationInput.textColor = [UIColor whiteColor];
      
      UILabel* date= [[UILabel alloc] initWithFrame:CGRectMake(5, 80, 150, 25)];
      date.text = @"Production Date:";
      date.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      date.backgroundColor = [UIColor clearColor];
      date.textColor =[UIColor whiteColor];
      
      _dateInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 80, 210, 25)];
      _dateInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _dateInput.textColor = [UIColor whiteColor];
      
      UILabel* stageManager= [[UILabel alloc] initWithFrame:CGRectMake(15, 110, 150, 25)];
      stageManager.text = @"Stage Manager:";
      stageManager.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      stageManager.backgroundColor = [UIColor clearColor];
      stageManager.textColor =[UIColor whiteColor];
      
      _stageManagerInput = [[UITextField alloc] initWithFrame:CGRectMake(135, 110, 210, 25)];
      _stageManagerInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _stageManagerInput.textColor = [UIColor whiteColor];
      
      [self addSubview:name];
      [self addSubview:_nameInput];
      [self addSubview:location];
      [self addSubview:_locationInput];
      [self addSubview:date];
      [self addSubview:_dateInput];
      [self addSubview:stageManager];
      [self addSubview:_stageManagerInput];
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

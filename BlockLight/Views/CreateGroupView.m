//
//  CreateGroupView.m
//  BlockLight
//
//  Created by Barrett Ames on 8/21/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "CreateGroupView.h"

@implementation CreateGroupView

@synthesize name = _nameInput;
@synthesize type = _typeInput; 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
      UILabel* name = [[UILabel alloc] initWithFrame:CGRectMake(5, 20, 150, 25)];
      name.text = @"Group Name:";
      name.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      name.backgroundColor = [UIColor clearColor];
      name.textColor =[UIColor whiteColor]; 
      
      _nameInput = [[UITextField alloc] initWithFrame:CGRectMake(110, 20, 210, 25)];
      _nameInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _nameInput.textColor = [UIColor whiteColor];
      
      UILabel* type = [[UILabel alloc] initWithFrame:CGRectMake(5, 70, 150, 25)];
      type.text = @"Group Type:";
      type.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
      type.backgroundColor = [UIColor clearColor];
      type.textColor =[UIColor whiteColor];
      
      _typeInput = [[UITextField alloc] initWithFrame:CGRectMake(110, 70, 210, 25)];
      _typeInput.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.1f];
      _typeInput.textColor = [UIColor whiteColor];
      
      
      [self addSubview:name];
      [self addSubview:_nameInput];
      [self addSubview:type];
      [self addSubview:_typeInput];
      
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

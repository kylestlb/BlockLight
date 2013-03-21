//
//  NoteView.m
//  BlockLight
//
//  Created by Barrett Ames on 9/3/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "NoteView.h"

@implementation NoteView

@synthesize noteInput = _noteInput;

- (id)initWithViewController:(UIViewController*)viewController
{
    self = [super init];
    if (self) {
        // Initialization code
      
      self.backgroundColor = [UIColor lightGrayColor];
      
      UILabel* textLabel = [[UILabel alloc] initWithFrame: CGRectMake(10, 10, 50, 15)];
      textLabel.text = @"Text";
      textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
      textLabel.backgroundColor = [UIColor clearColor];
      
      _noteInput = [[UITextField alloc ] initWithFrame:CGRectMake(10, 25, 300, 200)];
      _noteInput.backgroundColor = [UIColor clearColor];
      _noteInput.borderStyle = UITextBorderStyleBezel;
      
      UIButton* add = [UIButton buttonWithType:UIButtonTypeRoundedRect];
      add.frame = CGRectMake(10,240,300,50);
      add.titleLabel.textColor = [UIColor blackColor];
      [ add setTitle:@"Add Note" forState:UIControlStateNormal];
      [add addTarget:viewController action:@selector(addNoteView) forControlEvents:UIControlEventTouchUpInside];
      
      [self addSubview:add];
      [self addSubview:_noteInput];
      [self addSubview:textLabel];
      
      
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

//
//  Performer.m
//  BlockLight
//
//  Contains the data model for Performers 
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Performer.h"

@implementation Performer


-(id) init{
  self = [super init]; 
  if(self == nil) 
    return nil; 
  
  _icon = [UIImage imageNamed:@"performer.png"];
  [self setMinimumNumberOfTouches:1];
  [self setMaximumNumberOfTouches:1];
  
  return self;
}



@synthesize name = _name;
@synthesize role = _role;
@synthesize stagePresence = _stagePresence;
@synthesize notes = _notes;
@synthesize phoneNumber = _phoneNumber;
@synthesize email = _email;
@synthesize voice = _voice; 
@synthesize gender = _gender; 

@synthesize height = _height;
@synthesize uniqueID = _uniqueID; 

@synthesize visible = _visible; 
@synthesize icon = _icon; 

@end

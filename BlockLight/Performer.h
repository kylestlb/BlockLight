//
//  Performer.h
//  BlockLight
//  
//  Contains the data model for a performer 
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Defaults.h"

@interface Performer : UIPanGestureRecognizer{
  
  // Attributes of a performer 
  NSString* _name;
  NSString* _role;
  NSString* _stagePresence;
  NSString* _notes;
  NSString* _phoneNumber;
  NSString* _email; 
  NSString* _voice;
  NSString* _gender; 
  //Voice _voice;
  //Gender _gender;
  NSString* _height;
  NSNumber* _uniqueID; 
  
  // Display data 
  BOOL _visible;
  UIImage* _icon; 
  
}

@property (strong) NSString* name;
@property (strong) NSString* role;
@property (strong) NSString* stagePresence;
@property (strong) NSString* notes;
@property (strong) NSString* phoneNumber;
@property (strong) NSString* email; 
@property (strong) NSString* voice;
@property (strong) NSString* gender;
@property (strong) NSString* height;
@property (strong) NSNumber* uniqueID;

@property  (nonatomic) BOOL visible; 
@property (nonatomic, strong) UIImage* icon; 

@end

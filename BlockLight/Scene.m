//
//  Scene.m
//  BlockLight
//
//   This file will contain the data model for the scene 
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Scene.h"

@implementation Scene

-(id) init{
  
  self = [super init]; 
  
  if(self == nil) 
    return nil; 
  
  return self; 
  
}

@synthesize name = _name; 
@synthesize firstFrame = _firstFrame; 
@synthesize lastFrame = _lastFrame; 

@end

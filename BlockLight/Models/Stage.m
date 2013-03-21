//
//  Stage.m
//  BlockLight
//
//  This file contains the data model for the stage 
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Stage.h"

@implementation Stage


-(id) init{
  
  self = [super init]; 
  if(self == nil)
    return nil; 
  
  return self; 
  
}

@synthesize name = _name; 
@synthesize width = _width; 
@synthesize height = _height; 
@synthesize gridOpacity = _gridOpacity; 
@synthesize gridSpacing = _gridSpacing; 
@synthesize measurementType = _measurementType; 

@end

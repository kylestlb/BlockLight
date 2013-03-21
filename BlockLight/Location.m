//
//  Location.m
//  BlockLight
//  
//  Just a convience class for holding the location of things 
// 
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Location.h"

@implementation Location

-(id)init{
  
  self = [super self]; 
  if(self == nil) 
    return nil; 
  
  self.xCoordinate = [NSNumber numberWithInt:0]; 
  self.yCoordinate = [NSNumber numberWithInt:0];
  
  return self; 
  
}

@synthesize xCoordinate = _xCoordinate; 
@synthesize yCoordinate = _yCoordinate; 

-(void) updateX:(NSNumber *)x Y:(NSNumber *)y{
  
  self.xCoordinate = x; 
  self.yCoordinate = y; 
  
}

@end

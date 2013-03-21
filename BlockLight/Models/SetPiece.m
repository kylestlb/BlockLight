//
//  SetPiece.m
//  BlockLight
//
//  This file contains the data model for the setPieces 
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "SetPiece.h"

@implementation SetPiece

-(id) init{
  self = [super init]; 
  if(self == nil) 
    return nil; 
  
  _frameLocation = [NSMutableArray array]; 
  return self; 
}

@synthesize uniqueID = _uniqueID; 
@synthesize name = _name; 

@synthesize visible = _visible; 
@synthesize frameLocation =  _frameLocation; 
@synthesize icon = _icon; 

@end

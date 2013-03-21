//
//  Group.m
//  BlockLight
//
//   This file is the data model for a group 
//
//  Created by Barrett Ames on 8/27/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Group.h"

@implementation Group

-(id)init{
  self =[super init];
  
  if(self == nil)
    return nil;
  
  _performers = [[NSMutableArray alloc] initWithCapacity:15];
  _productions = [[NSMutableArray alloc] initWithCapacity:5];

  return self; 
}

@synthesize name = _name;
@synthesize type = _type; //what is this?
@synthesize uniqueID = _uniqueID;
@synthesize performers = _performers; 
@synthesize productions = _productions;


@end

//
//  userData.m
//  BlockLight
//
//  This file contains the data that the user has added. 
//
//  Created by Barrett Ames on 8/27/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "userData.h"

//TODO: Add data Permanence 

@implementation userData

@synthesize groups = _groups;
@synthesize uniqueGroupID = _uniqueGroupID;
@synthesize uniquePerformerID = _uniquePerformerID;

-(id) init{
  self = [super init];
  
  if(self == nil)
    return nil;
  
  _uniquePerformerID = [NSNumber numberWithInt:0];
  _uniqueGroupID = [NSNumber numberWithInt:0];
  _groups = [[NSMutableArray alloc] initWithCapacity:5]; 
  
  return self;
}

-(NSNumber*)nextUniqueGroupID{
  NSNumber* next = [NSNumber numberWithInt:_uniqueGroupID.intValue +1];
  _uniqueGroupID = next; 
  return  next;
}

-(NSNumber*)nextUniquePerformerID{
  NSNumber* next = [NSNumber numberWithInt:_uniquePerformerID.intValue +1];
  _uniquePerformerID = next;
  return  next;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_groups forKey:@"groups"];
    [encoder encodeObject:_uniqueGroupID forKey:@"groupID"];
    [encoder encodeObject:_uniquePerformerID forKey:@"performerID"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.groups = [decoder decodeObjectForKey:@"groups"];
        self.uniqueGroupID = [decoder decodeObjectForKey:@"groupID"];
        self.uniquePerformerID = [decoder decodeObjectForKey:@"performerID"];
    }
    return self;
}

@end

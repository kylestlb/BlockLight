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

@synthesize name = _name;
@synthesize uniqueID = _uniqueID;
@synthesize performers = _performers; 
@synthesize productions = _productions;

-(id)init{
  self =[super init];
  
  if(self == nil)
    return nil;
  
  _performers = [[NSMutableArray alloc] initWithCapacity:15];
  _productions = [[NSMutableArray alloc] initWithCapacity:5];

  return self; 
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_name forKey:@"groupName"];
    [encoder encodeObject:_uniqueID forKey:@"groupID"];
    [encoder encodeObject:_performers forKey:@"groupPerformers"];
    [encoder encodeObject:_productions forKey:@"groupProductions"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.name = [decoder decodeObjectForKey:@"groupName"];
        self.uniqueID = [decoder decodeObjectForKey:@"groupID"];
        self.performers = [decoder decodeObjectForKey:@"groupPerformers"];
        self.productions = [decoder decodeObjectForKey:@"groupProductions"];
    }
    return self;
}

@end

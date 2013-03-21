//
//  Position.m
//  BlockLight
//
//  This allows for easy storage of a performers position inside of a gesture recognizer 
//
//  Created by Barrett Ames on 8/30/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Position.h"

@implementation Position
-(id) init{
  
  self = [super init];
  
  if(self == nil)
    return nil;

  return self; 
}


@synthesize x;
@synthesize y; 
@end

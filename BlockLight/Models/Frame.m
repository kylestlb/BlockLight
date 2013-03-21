//
//  Frame.m
//  BlockLight
//
//  This contains the data model for a Frame 
//
//  Created by Barrett Ames on 8/29/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Frame.h"

@implementation Frame

@synthesize frameIcon = _frameIcon;
@synthesize spikePath = _spikePath;
@synthesize performerPositions = _performerPositions;
@synthesize performersOnStage = _performersOnStage; 
@synthesize note = _note; 
-(id)init{
  
  self = [super init];
  
  if (self == nil) {
    return nil;
  }
  
  _performerPositions = [[NSMutableDictionary alloc] init];
  _performersOnStage = [[NSMutableArray alloc] initWithCapacity:15];
  
  return self;
}

@end

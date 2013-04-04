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

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_frameIcon forKey:@"frameIcon"];
    [encoder encodeObject:_spikePath forKey:@"frameSpikePath"];
    [encoder encodeObject:_performersOnStage forKey:@"framePerformersOnStage"];
    [encoder encodeObject:_performerPositions forKey:@"framePerformerPositions"];
    [encoder encodeObject:_note forKey:@"frameNote"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.frameIcon = [decoder decodeObjectForKey:@"frameIcon"];
        self.spikePath = [decoder decodeObjectForKey:@"frameSpikePath"];
        self.performersOnStage = [decoder decodeObjectForKey:@"framePerformersOnStage"];
        self.performerPositions = [decoder decodeObjectForKey:@"framePerformerPositions"];
        self.note = [decoder decodeObjectForKey:@"frameNote"];
    }
    return self;
}
@end

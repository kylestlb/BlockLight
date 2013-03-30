//
//  Production.m
//  BlockLight
//
//  This file contains the data model for a production. 
//
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Production.h"

@implementation Production

@synthesize name = _name;
@synthesize stage = _stage;
@synthesize scenes = _scenes;
@synthesize performers = _performers;
@synthesize setPieces = _setPieces;
@synthesize notes = _notes;
@synthesize date = _date;
@synthesize location = _location;
@synthesize stageManager = _stageManager;
@synthesize frames = _frames;
@synthesize numFrames = _numFrames;
@synthesize curFrame = _curFrame;
@synthesize layouts = _layouts;

-(id) init{
  
  self = [super init]; 
  
  if(self == nil) 
    return nil; 
  
  self.scenes = [[NSMutableArray alloc] initWithCapacity:5];
  self.stage = [[Stage alloc] init];
  self.performers = [[NSMutableArray alloc] initWithCapacity:20];
  self.setPieces = [[NSMutableArray alloc] initWithCapacity:100];
  self.notes = [[NSMutableArray alloc] initWithCapacity:20];
  _frames = [[NSMutableArray alloc] initWithCapacity:100];
  _layouts = [[NSMutableDictionary alloc] init];
  _numFrames = 1;
  _curFrame = 0; 
  return self; 
}

-(void)addFrame{
  _numFrames = _numFrames +1; 
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_name forKey:@"productionName"];
    [encoder encodeObject:_stage forKey:@"productionStage"];
    [encoder encodeObject:_scenes forKey:@"productionScenes"];
    [encoder encodeObject:_performers forKey:@"productionPerformers"];
    [encoder encodeObject:_setPieces forKey:@"productionSetPieces"];
    [encoder encodeObject:_notes forKey:@"productionNotes"];
    [encoder encodeObject:_date forKey:@"productionDate"];
    [encoder encodeObject:_location forKey:@"productionLocation"];
    [encoder encodeObject:_stageManager forKey:@"productionStageManager"];
    [encoder encodeObject:_frames forKey:@"productionFrames"];
    [encoder encodeInt:_numFrames forKey:@"productionNumFrames"];
    [encoder encodeInt:_curFrame forKey:@"productionCurFrame"];
    [encoder encodeObject:_layouts forKey:@"productionLayouts"];
    
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){    
        self.name = [decoder decodeObjectForKey:@"productionName"];
        self.stage = [decoder decodeObjectForKey:@"productionStage"];
        self.scenes = [decoder decodeObjectForKey:@"productionScenes"];
        self.performers = [decoder decodeObjectForKey:@"productionPerformers"];
        self.setPieces = [decoder decodeObjectForKey:@"productionSetPieces"];
        self.notes = [decoder decodeObjectForKey:@"productionNotes"];
        self.date = [decoder decodeObjectForKey:@"productionDate"];
        self.location = [decoder decodeObjectForKey:@"productionLocation"];
        self.stageManager = [decoder decodeObjectForKey:@"productionStageManager"];
        self.frames = [decoder decodeObjectForKey:@"productionFrames"];
        self.numFrames = [decoder decodeIntForKey:@"productionNumFrames"];
        self.curFrame = [decoder decodeIntForKey:@"productionCurFrame"];
        self.layouts = [decoder decodeObjectForKey:@"productionLayouts"];
    }
    return self;
}



@end

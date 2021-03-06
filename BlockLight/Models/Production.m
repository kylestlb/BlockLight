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
@synthesize curScene = _curScene;
@synthesize date = _date;
@synthesize location = _location;
@synthesize stageManager = _stageManager;
@synthesize layouts = _layouts;

-(id) init{
  self = [super init]; 
  
  if(self == nil) 
    return nil; 
  
  self.scenes = [[NSMutableArray alloc] initWithCapacity:5];
  self.stage = [[Stage alloc] init];
  _layouts = [[NSMutableDictionary alloc] init];
  _curScene = 0;
  return self; 
}

-(void)addScene{
    Scene* newScene = [[Scene alloc] init];
    [_scenes addObject: newScene];
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_name forKey:@"productionName"];
    [encoder encodeObject:_stage forKey:@"productionStage"];
    [encoder encodeObject:_scenes forKey:@"productionScenes"];
    [encoder encodeInt:_curScene forKey:@"productionCurScene"];
    [encoder encodeObject:_date forKey:@"productionDate"];
    [encoder encodeObject:_location forKey:@"productionLocation"];
    [encoder encodeObject:_stageManager forKey:@"productionStageManager"];
    [encoder encodeObject:_layouts forKey:@"productionLayouts"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){    
        self.name = [decoder decodeObjectForKey:@"productionName"];
        self.stage = [decoder decodeObjectForKey:@"productionStage"];
        self.scenes = [decoder decodeObjectForKey:@"productionScenes"];
        self.curScene = [decoder decodeIntForKey:@"productionCurScene"];
        self.date = [decoder decodeObjectForKey:@"productionDate"];
        self.location = [decoder decodeObjectForKey:@"productionLocation"];
        self.stageManager = [decoder decodeObjectForKey:@"productionStageManager"];
        self.layouts = [decoder decodeObjectForKey:@"productionLayouts"];
    }
    return self;
}

@end

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

@end

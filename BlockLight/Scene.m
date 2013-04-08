//
//  Scene.m
//  BlockLight
//
//   This file will contain the data model for the scene 
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Scene.h"

@implementation Scene

@synthesize name = _name; 
@synthesize firstFrame = _firstFrame; 
@synthesize lastFrame = _lastFrame; 

-(id) init
{
  self = [super init]; 
  
  if(self == nil) 
    return nil; 
  
  return self; 
  
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_name forKey:@"sceneName"];
    [encoder encodeObject:_firstFrame forKey:@"sceneFirstFrame"];
    [encoder encodeObject:_lastFrame forKey:@"sceneLastFrame"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.name = [decoder decodeObjectForKey:@"sceneName"];
        self.firstFrame = [decoder decodeObjectForKey:@"sceneFirstFrame"];
        self.lastFrame = [decoder decodeObjectForKey:@"sceneLastFrame"];
    }
    return self;
}

@end

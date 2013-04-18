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
@synthesize frames = _frames;
@synthesize curFrame = _curFrame;

-(id) init{
    self = [super init];
    
    if(self == nil)
        return nil;
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_name forKey:@"sceneName"];
    [encoder encodeObject:_frames forKey:@"sceneFrames"];
    [encoder encodeObject:_curFrame forKey:@"sceneCurFrame"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.name = [decoder decodeObjectForKey:@"sceneName"];
        self.frames = [decoder decodeObjectForKey:@"sceneFrames"];
        self.curFrame = [decoder decodeObjectForKey:@"sceneCurFrame"];
    }
    return self;
}

@end

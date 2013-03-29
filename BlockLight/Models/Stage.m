//
//  Stage.m
//  BlockLight
//
//  This file contains the data model for the stage 
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Stage.h"

@implementation Stage

@synthesize name = _name;
@synthesize width = _width;
@synthesize height = _height;
@synthesize gridOpacity = _gridOpacity;
@synthesize gridSpacing = _gridSpacing;
@synthesize measurementType = _measurementType;

-(id) init{
  
  self = [super init]; 
  if(self == nil)
    return nil; 
  
  return self; 
  
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_name forKey:@"stageName"];
    [encoder encodeObject:_width forKey:@"stageWidth"];
    [encoder encodeObject:_height forKey:@"stageHeight"];
    [encoder encodeObject:_gridOpacity forKey:@"stageGridOpacity"];
    [encoder encodeObject:_gridSpacing forKey:@"stageGridSpacing"];
    [encoder encodeInt:_measurementType forKey:@"stageMeasurmentType"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.name = [decoder decodeObjectForKey:@"stageName"];
        self.width = [decoder decodeObjectForKey:@"stageWidth"];
        self.height = [decoder decodeObjectForKey:@"stageHeight"];
        self.gridOpacity = [decoder decodeObjectForKey:@"stageGridOpacity"];
        self.gridSpacing = [decoder decodeObjectForKey:@"stageGridSpacing"];
        self.measurementType = [decoder decodeIntForKey:@"stageMeasurementType"];
    }
    return self;
}

@end

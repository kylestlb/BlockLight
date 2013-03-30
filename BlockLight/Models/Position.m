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

@synthesize x;
@synthesize y; 

-(id) init{
  
  self = [super init];
  
  if(self == nil)
    return nil;

  return self; 
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeInt:x forKey:@"positionX"];
    [encoder encodeInt:y forKey:@"positionY"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.x = [decoder decodeIntForKey:@"positionX"];
        self.y = [decoder decodeIntForKey:@"positionY"];
    }
    return self;
}


@end

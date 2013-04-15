//
//  Position.m
//  BlockLight
//  
//  Just a convience class for holding the location of things 
// 
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Position.h"

@implementation Position

@synthesize xCoordinate = _xCoordinate;
@synthesize yCoordinate = _yCoordinate;

-(id)init{
  self = [super self]; 
  if(self == nil) 
    return nil; 
  
  self.xCoordinate = [NSNumber numberWithInt:0]; 
  self.yCoordinate = [NSNumber numberWithInt:0];
  
  return self; 
}

-(void) updateX:(NSNumber *)x Y:(NSNumber *)y{
  self.xCoordinate = x; 
  self.yCoordinate = y; 
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_xCoordinate forKey:@"PositionXCoor"];
    [encoder encodeObject:_yCoordinate forKey:@"PositionYCoor"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.xCoordinate = [decoder decodeObjectForKey:@"PositionXCoor"];
        self.yCoordinate = [decoder decodeObjectForKey:@"PostionYCoor"];
    }
    return self;
}

@end

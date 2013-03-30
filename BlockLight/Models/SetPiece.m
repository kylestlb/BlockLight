//
//  SetPiece.m
//  BlockLight
//
//  This file contains the data model for the setPieces 
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "SetPiece.h"

@implementation SetPiece

@synthesize uniqueID = _uniqueID;
@synthesize name = _name;

@synthesize visible = _visible;
@synthesize frameLocation =  _frameLocation;
@synthesize icon = _icon;

-(id) init{
  self = [super init]; 
  if(self == nil) 
    return nil; 
  
  _frameLocation = [NSMutableArray array]; 
  return self; 
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_uniqueID forKey:@"setPieceID"];
    [encoder encodeObject:_name forKey:@"setPieceName"];
    [encoder encodeBool:_visible forKey:@"setPieceVisible"];
    [encoder encodeObject:_frameLocation forKey:@"setPieceFrameLocation"];
    [encoder encodeObject:UIImagePNGRepresentation(_icon) forKey:@"setPieceIcon"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.uniqueID = [decoder decodeObjectForKey:@"setPieceID"];
        self.name = [decoder decodeObjectForKey:@"setPieceName"];
        self.visible = [decoder decodeBoolForKey:@"setPieceVisible"];
        self.frameLocation = [decoder decodeObjectForKey:@"setPieceFrameLocation"];
        self.icon = [UIImage imageWithData:[decoder decodeObjectForKey:@"setPieceIcon"]];
    } 
    return self;
}

@end

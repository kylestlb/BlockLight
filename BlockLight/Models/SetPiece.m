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

@synthesize name = _name;
@synthesize uniqueID = _uniqueID;
@synthesize icon = _icon;
@synthesize frameLocation = _frameLocation;

@synthesize visible = _visible;

-(id) init{
    self = [super init]; 
  
    if(self == nil)
        return nil; 
  
    _frameLocation = [[Position alloc] init];
    
    return self; 
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_name forKey:@"setPieceName"];
    [encoder encodeObject:_uniqueID forKey:@"setPieceID"];
    [encoder encodeObject:UIImagePNGRepresentation(_icon) forKey:@"setPieceIcon"];
    [encoder encodeObject:_frameLocation forKey:@"setPieceFrameLocation"];
    [encoder encodeBool:_visible forKey:@"setPieceVisible"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.name = [decoder decodeObjectForKey:@"setPieceName"];
        self.uniqueID = [decoder decodeObjectForKey:@"setPieceID"];
        self.icon = [UIImage imageWithData:[decoder decodeObjectForKey:@"setPieceIcon"]];
        self.frameLocation = [decoder decodeObjectForKey:@"setPieceFrameLocation"];
        self.visible = [decoder decodeBoolForKey:@"setPieceVisible"];
    }
    return self;
}

@end

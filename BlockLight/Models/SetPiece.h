//
//  SetPiece.h
//  BlockLight
//
//  Contains the data model for a set piece 
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Position.h"

@interface SetPiece : NSObject{
    // set piece attributes
    NSString* _name;
    NSNumber* _uniqueID;
    UIImage * _icon;
    Position* _frameLocation;
  
    BOOL _visible;
}

@property (strong) NSString* name;
@property (strong) NSNumber* uniqueID;
@property (strong) UIImage * icon;
@property (strong) Position* frameLocation;

@property BOOL visible;

@end

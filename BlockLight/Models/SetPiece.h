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

@interface SetPiece : NSObject{
  
  // set piece attributes 
  NSNumber* _uniqueID;
  NSString* _name; 
  
  // Display Data 
  BOOL _visible; 
  NSMutableArray* _frameLocation; 
  UIImage * _icon; 
  
}

@property (strong) NSNumber* uniqueID; 
@property (strong) NSString* name;


@property  (nonatomic) BOOL visible; 
@property (strong) NSMutableArray* frameLocation; 
@property (readonly, strong) UIImage* icon;


@end

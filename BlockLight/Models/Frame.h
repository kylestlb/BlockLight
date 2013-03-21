//
//  Frame.h
//  BlockLight
//
//  Created by Barrett Ames on 8/29/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Frame : NSObject{
  UIImage* _frameIcon;
  UIBezierPath* _spikePath;
  NSMutableArray* _performersOnStage;
  NSMutableDictionary* _performerPositions;
  NSString* _note;
  BOOL _notePresent; 
}

@property (strong) UIImage* frameIcon;
@property (strong) UIBezierPath* spikePath;
@property (strong) NSMutableArray* performersOnStage;
@property (strong) NSMutableDictionary* performerPositions;
@property (strong) NSString* note;

@end

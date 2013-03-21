//
//  Production.h
//  BlockLight
//  
//  This file is the data model for a Production 
// 
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stage.h"
@interface Production : NSObject{
  
  NSString* _name;
  NSString* _location;
  NSString* _date;
  NSString* _stageManager;
  Stage* _stage; 
  NSMutableArray* _scenes;
  NSMutableArray* _frames; 
  NSMutableArray* _performers; 
  NSMutableArray* _setPieces; 
  NSMutableArray* _notes;
  NSInteger  _numFrames;
  NSInteger  _curFrame;
  NSMutableDictionary* _layouts; 
}

@property (strong) NSString* name;
@property (strong) NSString* location;
@property (strong) NSString* date;
@property (strong) NSString* stageManager; 
@property (strong) Stage* stage; 
@property (strong) NSMutableArray* scenes;
@property (strong) NSMutableArray* frames; 
@property (strong) NSMutableArray* performers; 
@property (strong) NSMutableArray* setPieces; 
@property (strong) NSMutableArray* notes;
@property (strong) NSMutableDictionary* layouts; 
@property  NSInteger numFrames;
@property  NSInteger curFrame; 
@end

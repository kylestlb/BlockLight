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
#import "Scene.h"

@interface Production : NSObject{
    NSString* _name;
    Stage* _stage; 
    NSMutableArray* _scenes;
    NSInteger  _curScene;
    NSString* _date;
    NSString* _location;
    NSString* _stageManager;
    NSMutableDictionary* _layouts; 
}

@property (strong) NSString* name;
@property (strong) Stage* stage; 
@property (strong) NSMutableArray* scenes;
@property  NSInteger curScene;
@property (strong) NSString* date;
@property (strong) NSString* location;
@property (strong) NSString* stageManager; 
@property (strong) NSMutableDictionary* layouts;
@end

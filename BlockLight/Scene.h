//
//  Scene.h
//  BlockLight
//
//  Data model for Scene 
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Scene : NSObject{
  
  // scene attributes 
  NSString* _name; 
  NSNumber* _firstFrame; 
  NSNumber* _lastFrame; 
  
}

@property (strong) NSString* name; 
@property (strong) NSNumber* firstFrame; 
@property (strong) NSNumber* lastFrame; 

@end

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
    NSMutableArray* _frames;
    NSInteger _curFrame;
}

@property (strong) NSString* name; 
@property (strong) NSMutableArray* frames;
@property NSInteger curFrame;

@end

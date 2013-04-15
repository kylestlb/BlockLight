//
//  userData.h
//  BlockLight
//
//  Created by Barrett Ames on 8/27/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userData : NSObject{
  NSMutableArray* _groups;
  NSNumber* _uniqueGroupID;
  NSNumber* _uniquePerformerID; 
}

@property (strong) NSMutableArray* groups;
@property (strong) NSNumber* uniqueGroupID;
@property (strong) NSNumber* uniquePerformerID; 

-(NSNumber*)nextUniquePerformerID;
-(NSNumber*)nextUniqueGroupID;

@end

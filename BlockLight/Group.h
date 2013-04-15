//
//  Group.h
//  BlockLight
//
//  Created by Barrett Ames on 8/27/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject{
  NSString* _name;
  NSMutableArray* _performers;
  NSMutableArray* _productions; 
  NSNumber* _uniqueID;
}

@property (strong) NSString* name;
@property (strong) NSNumber* uniqueID; 
@property (strong) NSMutableArray* performers;
@property (strong) NSMutableArray* productions; 

@end

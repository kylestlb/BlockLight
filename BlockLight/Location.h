//
//  Location.h
//  BlockLight
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject{
  NSNumber* _xCoordinate; 
  NSNumber* _yCoordinate; 
}

@property (strong) NSNumber* xCoordinate; 
@property (strong) NSNumber* yCoordinate; 

// Compound x and y update function 
-(void)updateX:(NSNumber*)x Y:(NSNumber*) y; 

@end

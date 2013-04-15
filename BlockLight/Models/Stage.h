//
//  Stage.h
//  BlockLight
//
//  data model for the stage 
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Defaults.h"

@interface Stage : NSObject{
  // Stage Attributes
  NSString* _name; 
  NSNumber* _width; 
  NSNumber* _height; 
  NSNumber* _gridOpacity; 
  NSNumber* _gridSpacing; 
  MeasurementType _measurementType; 
}

@property (strong) NSString* name; 
@property (strong) NSNumber* width; 
@property (strong) NSNumber* height; 
@property (strong) NSNumber* gridOpacity; 
@property (strong) NSNumber* gridSpacing; 
@property (nonatomic) MeasurementType measurementType; 

@end

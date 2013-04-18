//
//  Actor.h
//  BlockLight
//
//  Created by nang1 on 4/11/13.
//  Copyright (c) 2013 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Position.h"

@interface Actor : NSObject{
    NSNumber* _actorID;
    Position* _actorPosition;
}

@property (strong) NSNumber* actorID;
@property (strong) Position* actorPosition;

@end

//
//  Actor.m
//  BlockLight
//
//  Created by nang1 on 4/11/13.
//  Copyright (c) 2013 BlockLight. All rights reserved.
//

#import "Actor.h"

@implementation Actor

@synthesize actorID = _actorID;
@synthesize actorPosition = _actorPosition;

//may need to initialize with actorID
-(id)init{
    self = [super init];
    
    if(self == nil)
        return nil;
    
    _actorPosition = [[Position alloc] init];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_actorID forKey:@"actorID"];
    [encoder encodeObject:_actorPosition forKey:@"actorPosition"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.actorID = [decoder decodeObjectForKey:@"actorID"];
        self.actorPosition = [decoder decodeObjectForKey:@"actorPosition"];
    }
    return self;
}

@end

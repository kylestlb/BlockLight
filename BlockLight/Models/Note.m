//
//  Note.m
//  BlockLight
//
//  Created by nang1 on 4/11/13.
//  Copyright (c) 2013 BlockLight. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize noteStr = _noteStr;
@synthesize notePosition = _notePosition;

-(id)init{
    self = [super init];
    
    if(self ==nil)
        return nil;
    
    _notePosition = [[Position alloc] init];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_noteStr forKey:@"noteStr"];
    [encoder encodeObject:_notePosition forKey:@"notePosition"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.noteStr = [decoder decodeObjectForKey:@"noteStr"];
        self.notePosition = [decoder decodeObjectForKey:@"notePosition"];
    }
    return self;
}

@end

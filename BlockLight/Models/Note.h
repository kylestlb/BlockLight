//
//  Note.h
//  BlockLight
//
//  Created by nang1 on 4/11/13.
//  Copyright (c) 2013 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Position.h"

@interface Note : NSObject{
    NSString* _noteStr;
    Position* _notePosition;
}

@property (strong) NSString* noteStr;
@property (strong) Position* notePosition;

@end

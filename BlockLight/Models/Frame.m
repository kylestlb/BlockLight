//
//  Frame.m
//  BlockLight
//
//  This contains the data model for a Frame 
//
//  Created by Barrett Ames on 8/29/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Frame.h"

@implementation Frame

@synthesize frameIcon = _frameIcon;
@synthesize spikePath = _spikePath;
@synthesize actorsOnStage = _actorsOnStage;
@synthesize setPieces = _setPieces;
@synthesize notes = _notes;
@synthesize notesPresent = _notesPresent;

-(id)init{
    self = [super init];
  
    if (self == nil)
        return nil;
  
    _actorsOnStage = [[NSMutableArray alloc] initWithCapacity:15];
    _setPieces = [[NSMutableArray alloc] initWithCapacity:5];
    _notes = [[NSMutableArray alloc] initWithCapacity:0];
    _notesPresent = FALSE;
  
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_frameIcon forKey:@"frameIcon"];
    [encoder encodeObject:_spikePath forKey:@"frameSpikePath"];
    [encoder encodeObject:_actorsOnStage forKey:@"frameActorsOnStage"];
    [encoder encodeObject:_setPieces forKey:@"frameSetPieces"];
    [encoder encodeObject:_notes forKey:@"frameNotes"];
    [encoder encodeBool:_notesPresent forKey:@"frameNotesPresent"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.frameIcon = [decoder decodeObjectForKey:@"frameIcon"];
        self.spikePath = [decoder decodeObjectForKey:@"frameSpikePath"];
        self.actorsOnStage = [decoder decodeObjectForKey:@"frameActorsOnStage"];
        self.setPieces = [decoder decodeObjectForKey:@"frameSetPieces"];
        self.notes = [decoder decodeObjectForKey:@"frameNotes"];
        self.notesPresent = [decoder decodeBoolForKey:@"frameNotesPresent"];
    }
    return self;
}
@end

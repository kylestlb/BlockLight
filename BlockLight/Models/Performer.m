//
//  Performer.m
//  BlockLight
//
//  Contains the data model for Performers 
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "Performer.h"

@implementation Performer

@synthesize name = _name;
@synthesize role = _role;
@synthesize stagePresence = _stagePresence;
@synthesize notes = _notes;
@synthesize phoneNumber = _phoneNumber;
@synthesize email = _email;
@synthesize voice = _voice;
@synthesize gender = _gender;
@synthesize height = _height;
@synthesize uniqueID = _uniqueID;

@synthesize visible = _visible;
@synthesize icon = _icon;

-(id) init{
  self = [super init]; 
  if(self == nil) 
    return nil; 
  
  _icon = [UIImage imageNamed:@"performer.png"];
  [self setMinimumNumberOfTouches:1];
  [self setMaximumNumberOfTouches:1];
  
  return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_name forKey:@"performerName"];
    [encoder encodeObject:_role forKey:@"performerRole"];
    [encoder encodeObject:_stagePresence forKey:@"performerPresence"];
    [encoder encodeObject:_notes forKey:@"performerNotes"];
    [encoder encodeObject:_phoneNumber forKey:@"performerPhone"];
    [encoder encodeObject:_email forKey:@"performerEmail"];
    [encoder encodeObject:_voice forKey:@"performerVoice"];
    [encoder encodeObject:_gender forKey:@"performerGender"];
    [encoder encodeObject:_height forKey:@"performerHeight"];
    [encoder encodeObject:_uniqueID forKey:@"performerID"];
    [encoder encodeBool:_visible forKey:@"performerVisible"];
    [encoder encodeObject:UIImagePNGRepresentation(_icon) forKey:@"performerIcon"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if(self = [super init]){
        self.name = [decoder decodeObjectForKey:@"performerName"];
        self.role = [decoder decodeObjectForKey:@"performerRole"];
        self.stagePresence = [decoder decodeObjectForKey:@"performerPresence"];
        self.notes = [decoder decodeObjectForKey:@"performerNotes"];
        self.phoneNumber = [decoder decodeObjectForKey:@"performerPhone"];
        self.email = [decoder decodeObjectForKey:@"performerEmail"];
        self.voice = [decoder decodeObjectForKey:@"performerVoice"];
        self.gender = [decoder decodeObjectForKey:@"performerGender"];
        self.height = [decoder decodeObjectForKey:@"performerHeight"];
        self.uniqueID = [decoder decodeObjectForKey:@"performerID"];
        self.visible = [decoder decodeBoolForKey:@"performerVisible"];
        self.icon = [UIImage imageWithData:[decoder decodeObjectForKey:@"performerIcon"]];
    }
    return self;
}

@end

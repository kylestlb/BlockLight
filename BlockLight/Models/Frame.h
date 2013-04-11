//
//  Frame.h
//  BlockLight
//
//  Created by Barrett Ames on 8/29/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Frame : NSObject{
    UIImage* _frameIcon;
    UIBezierPath* _spikePath;
    NSMutableArray* _actorsOnStage;
    NSMutableArray* _setPieces;
    NSMutableArray* _notes;
    BOOL _notesPresent; //show or hide notes
}

@property (strong) UIImage* frameIcon;
@property (strong) UIBezierPath* spikePath;
@property (strong) NSMutableArray* actorsOnStage;
@property (strong) NSMutableArray* setPieces;
@property (strong) NSMutableArray* notes;
@property BOOL notesPresent;

@end

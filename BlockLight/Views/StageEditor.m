//
//  StageEditor.m
//  BlockLight
//
//  Created by Barrett Ames on 7/30/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "StageEditor.h"
#import <QuartzCore/QuartzCore.h>

@implementation StageEditor

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg-production.jpg"]];
      
      //[self addSubview: [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"squareStage.png" ]]]; 
      
      UIColor* _theColor = [UIColor grayColor];
      
      // Edit Stage Label 
      UILabel* _editLabel = [[UILabel alloc] initWithFrame:CGRectMake(365, 35, 150, 50)]; 
      _editLabel.text = @"Edit Stage"; 
      _editLabel.font = [UIFont boldSystemFontOfSize:20]; 
      [self addSubview:_editLabel]; 
      
      // This is what it takes to make a round rectangle with a shadow 
      UIView* _roundRect = [[UIView alloc] initWithFrame:CGRectMake(0, 0,300, 300)]; 
      _roundRect.layer.backgroundColor = [UIColor grayColor].CGColor;
      _roundRect.layer.cornerRadius = 10.0; 
      _roundRect.layer.masksToBounds = YES; 
      
      UIView* _shadowRect = [[UIView alloc] initWithFrame:CGRectMake(362, 75,300, 300)]; 
      _shadowRect.layer.masksToBounds = YES; 
      _shadowRect.layer.cornerRadius =  10; 
      _shadowRect.layer.borderColor =  [UIColor blackColor].CGColor;
      _shadowRect.layer.borderWidth = 3.0f; 
      _shadowRect.layer.shadowColor = [UIColor grayColor].CGColor;
      _shadowRect.layer.shadowRadius = 10.0; 
      _shadowRect.layer.shadowOffset =CGSizeMake(0.0, 0.0); 
      _shadowRect.layer.opacity =1.0; 
      [_shadowRect addSubview:_roundRect]; 
      [self addSubview:_shadowRect];  
      
      // labels have to go ontop of the rectangle, and thus after in the view hierarchy 
      UILabel* _presetLabel = [[UILabel alloc] initWithFrame:CGRectMake(410, 90, 150, 25)]; 
      _presetLabel.text = @"Preset"; 
      _presetLabel.font = [UIFont systemFontOfSize:18.0]; 
      _presetLabel.backgroundColor = _theColor; 
      [self addSubview:_presetLabel]; 
      
      _selectPreset = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
      _selectPreset.frame = CGRectMake(470, 90, 175, 25); 
      [_selectPreset setTitle:@"Select Preset Stage" forState:UIControlStateNormal]; 
      [self addSubview:_selectPreset]; 
      
      _stageName = [[UITextField alloc] initWithFrame:CGRectMake(410, 130, 235, 25)]; 
      _stageName.textAlignment = UITextAlignmentCenter; 
      _stageName.text = @"Stage Name"; 
      _stageName.backgroundColor = [UIColor whiteColor]; 
      [self addSubview:_stageName]; 
      
      UILabel* _widthLabel = [[UILabel alloc] initWithFrame:CGRectMake(410, 170, 50, 25)]; 
      _widthLabel.text = @"Width"; 
      _widthLabel.backgroundColor = _theColor; 
      [self addSubview:_widthLabel]; 
      
      _stageWidth = [[UITextField alloc] initWithFrame:CGRectMake(470, 170, 100, 25)]; 
      _stageWidth.backgroundColor = [UIColor whiteColor]; 
      _stageWidth.text = @"0"; 
      _stageWidth.textAlignment = UITextAlignmentCenter; 
      [self addSubview:_stageWidth]; 
      
      UILabel* _heightLabel = [[UILabel alloc] initWithFrame:CGRectMake(410, 210, 50, 25)]; 
      _heightLabel.text = @"Height"; 
      _heightLabel.backgroundColor = _theColor; 
      [self addSubview:_heightLabel]; 
      
      _stageHeight = [[UITextField alloc] initWithFrame:CGRectMake(470, 210, 100, 25)]; 
      _stageHeight.backgroundColor = [UIColor whiteColor]; 
      _stageHeight.text=@"0"; 
      _stageHeight.textAlignment=UITextAlignmentCenter; 
      [self addSubview:_stageHeight]; 
      
      
      // Edit Apron Label 
      UILabel* _apronLabel = [[UILabel alloc] initWithFrame:CGRectMake(365, 375, 150, 50)]; 
      _apronLabel.text = @"Stage Apron"; 
      _apronLabel.font = [UIFont boldSystemFontOfSize:20]; 
      [self addSubview:_apronLabel]; 
      
      UIView* _roundRect2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,300, 50)]; 
      _roundRect2.layer.backgroundColor = [UIColor grayColor].CGColor;
      _roundRect2.layer.cornerRadius = 10.0; 
      _roundRect2.layer.masksToBounds = YES; 
      
      UIView* _shadowRect2 = [[UIView alloc] initWithFrame:CGRectMake(362, 415,300, 50)]; 
      _shadowRect2.layer.masksToBounds = YES; 
      _shadowRect2.layer.cornerRadius =  10; 
      _shadowRect2.layer.borderColor =  [UIColor blackColor].CGColor;
      _shadowRect2.layer.borderWidth = 3.0f; 
      _shadowRect2.layer.shadowColor = [UIColor grayColor].CGColor;
      _shadowRect2.layer.shadowRadius = 10.0; 
      _shadowRect2.layer.shadowOffset =CGSizeMake(0.0, 0.0); 
      _shadowRect2.layer.opacity =1.0; 
      [_shadowRect2 addSubview:_roundRect2]; 
      [self addSubview:_shadowRect2];  
      
    }
    return self;
}


@synthesize selectPreset= _selectPreset;
@synthesize stageName=_stageName; 
@synthesize stageWidth=_stageWidth; 
@synthesize stageHeight=_stageHeight; 

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 10, [UIColor blackColor].CGColor); 
  CGContextSetLineWidth(context, 2.0);
  CGContextMoveToPoint(context, 50,25); 
  CGContextAddLineToPoint(context, 974, 25);
  CGContextAddLineToPoint(context, 974, 550);
  CGContextAddArcToPoint(context, 512,700, 50,550, 1500);
  CGContextAddLineToPoint(context, 50, 550);
  
  CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
  CGContextFillPath(context);
}


@end

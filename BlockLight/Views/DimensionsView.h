//
//  DimensionsView.h
//  BlockLight
//
//  Created by Barrett Ames on 7/30/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DimensionsView : UIView{
  UIButton* _selectPreset; 
  UITextField* _stageName; 
  UITextField* _stageWidth;
  UITextField* _stageHeight; 
}

@property (strong) UIButton* selectPreset; 
@property (strong) UITextField* stageName; 
@property (strong) UITextField* stageWidth; 
@property (strong) UITextField* stageHeight; 
@end

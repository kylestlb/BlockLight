//
//  NoteView.h
//  BlockLight
//
//  Created by Barrett Ames on 9/3/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteView : UIView{
  UITextField* _noteInput;
  
}
- (id)initWithViewController:(UIViewController*)viewController;

@property (strong) UITextField* noteInput;

@end

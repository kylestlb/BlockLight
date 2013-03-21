//
//  MasterView.h
//  BlockLight
//
//  Created by Barrett Ames on 8/16/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MasterView : UIView{
  
  UILabel* _block;
  UILabel* _light;
  UILabel* _groupName; 
  UIImageView* _groupIcon;
  
}

-(id)initWithDelegate:(id)viewController;
-(void)groupView:(BOOL)toggle;
-(void)groupImage:(UIImage*)icon withName:(NSString*)name;

@end

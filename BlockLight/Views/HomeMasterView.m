//
//  HomeMasterView.m
//  BlockLight
//
//  Created by Barrett Ames on 8/16/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "HomeMasterView.h"

@implementation HomeMasterView

- (id)initWithDelegate:(id)viewController
{
    self = [super init];
    if (self) {
      self.backgroundColor = [UIColor clearColor];
      UITableView* table =[[UITableView alloc] initWithFrame:CGRectMake(0, 200, 320, 600) style:UITableViewStyleGrouped];
      table.delegate = viewController;
      table.dataSource = viewController;
      table.backgroundColor = [UIColor clearColor];
      table.backgroundView = nil;
      table.scrollEnabled = NO;      
      
      _block = [[UILabel alloc] initWithFrame:CGRectMake(55, 25, 250, 100)];
      _light = [[UILabel alloc] initWithFrame:CGRectMake(70, 71, 250, 100)];
      
      _groupIcon = [[UIImageView alloc] initWithFrame:CGRectMake(15, 75, 120 , 80)];
      _groupIcon.layer.borderColor = [UIColor grayColor].CGColor;
      _groupIcon.layer.borderWidth = 2.0f;
      
      _groupName = [[UILabel alloc] initWithFrame:CGRectMake(140, 45, 170, 140)];
      _groupName.font = [UIFont fontWithName:@"Helvetica-Bold" size:25];
      _groupName.textColor = [UIColor whiteColor];
      _groupName.lineBreakMode = UILineBreakModeWordWrap;
      _groupName.numberOfLines =0;
      _groupName.backgroundColor = [UIColor clearColor]; 
      

      [self groupView:NO];

      [self addSubview:_block];
      [self addSubview:_light];
      [self addSubview:_groupIcon];
      [self addSubview:_groupName];
      [self addSubview:table];

    }
    return self;
}

-(void)groupImage:(UIImage *)icon withName:(NSString*)name{
  
  _groupIcon.image = icon;
  _groupName.text = name; 
}

-(void)groupView:(BOOL)toggle{
  
  if(toggle){
    
    _block.frame = CGRectMake(15, -20, 250, 100);
    _block.backgroundColor = [UIColor clearColor];
    _block.text = @"BLOCK";
    _block.font = [UIFont fontWithName:@"Helvetica" size:30];
    _block.textColor = [UIColor whiteColor];
    _block.shadowColor = [UIColor grayColor];
    _block.shadowOffset = CGSizeMake(0,1);
    
    _light.frame = CGRectMake(115, -20, 250, 100);
    _light.backgroundColor = [UIColor clearColor];
    _light.text = @"LIGHT";
    _light.font = [UIFont fontWithName:@"Helvetica-Bold" size:30];
    _light.textColor = [UIColor whiteColor];
    _light.shadowColor = [UIColor grayColor];
    _light.shadowOffset = CGSizeMake(0,1);
    
    _groupIcon.hidden = NO;
    _groupName.hidden = NO; 
  }
  else{
    _block.frame = CGRectMake(55, 25, 250, 100); 
    _block.backgroundColor = [UIColor clearColor];
    _block.text = @"BLOCK";
    _block.font = [UIFont fontWithName:@"Helvetica" size:60];
    _block.textColor = [UIColor whiteColor];
    _block.shadowColor = [UIColor grayColor];
    _block.shadowOffset = CGSizeMake(0,1);
    
    _light.frame = CGRectMake(70, 71, 250, 100);
    _light.backgroundColor = [UIColor clearColor];
    _light.text = @"LIGHT";
    _light.font = [UIFont fontWithName:@"Helvetica-Bold" size:60];
    _light.textColor = [UIColor whiteColor];
    _light.shadowColor = [UIColor grayColor];
    _light.shadowOffset = CGSizeMake(0,1);
    
    _groupIcon.hidden = YES;
    _groupName.hidden = YES; 
  }
  

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}*/


@end

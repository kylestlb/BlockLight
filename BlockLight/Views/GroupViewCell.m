//
//  GroupViewCell.m
//  BlockLight
//
//  Created by Barrett Ames on 8/11/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "GroupViewCell.h"

// Called to show information of production group in GroupViewController and ContactsViewController

@implementation GroupViewCell
// Need to create different cells for group model and production model b/c
// Group model does not contain elements to hold production date, location, stage manager

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andGroup:(Group*)group
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
      UIImage* icon = [UIImage imageNamed:@"testImage.png"];
      UIImageView * iconPos = [[UIImageView alloc] initWithImage:icon]; 
      iconPos.frame = CGRectMake(50, 8, 165, 136); 
      
      UILabel* groupName = [[UILabel alloc] initWithFrame:CGRectMake(225, 10, 350, 25)];
      groupName.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
      groupName.text = group.name;
      groupName.textColor = [UIColor whiteColor];
      groupName.backgroundColor =[UIColor clearColor];
      
      UILabel* productionDate = [[UILabel alloc] initWithFrame:CGRectMake(225, 30, 350, 25)];
      productionDate.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
      productionDate.text = @"Production Date:";
      productionDate.textColor = [UIColor blackColor];
      productionDate.backgroundColor =[UIColor clearColor];
    
	
		//number of productions showed correct number in contacts window,
		//but showed incorrect number in groups window (might be b/c I used the back button, so it didn't update)
		UILabel* numProductions = [[UILabel alloc] initWithFrame:CGRectMake(225, 50, 350, 25)];
        numProductions.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        numProductions.text = [NSString stringWithFormat:@"Number of Productions:%d",[group.productions count]];
        numProductions.textColor = [UIColor blackColor];
        numProductions.backgroundColor =[UIColor clearColor];
      UILabel* location = [[UILabel alloc] initWithFrame:CGRectMake(225, 70, 350, 25)];
      location.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
      location.text = @"Location:";
      location.textColor = [UIColor blackColor];
      location.backgroundColor =[UIColor clearColor];
      
      UILabel* stageManager = [[UILabel alloc]  initWithFrame:CGRectMake(225, 90, 350, 25)];
      stageManager.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
      stageManager.text = @"Stage Manager:";
      stageManager.textColor = [UIColor blackColor];
      stageManager.backgroundColor = [UIColor clearColor];
      
      UILabel* groupSize = [[UILabel alloc] initWithFrame:CGRectMake(225, 110, 350, 25)];
      groupSize.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
      groupSize.text = [ NSString stringWithFormat:@"Group Size:%d",[group.performers count] ];
      groupSize.textColor = [UIColor blackColor];
      groupSize.backgroundColor = [UIColor clearColor];
      
     
      
      
      [self addSubview:groupName];
      [self addSubview:productionDate];
	  [self addSubview:numProductions];
      [self addSubview:location]; 
      [self addSubview:stageManager];
      [self addSubview:groupSize];
      [self addSubview:iconPos]; 
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
  if(selected)
    self.backgroundColor =[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:.5];
  else
    self.backgroundColor =[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:.5];

}

@end

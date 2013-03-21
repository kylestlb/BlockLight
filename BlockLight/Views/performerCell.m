//
//  performerCell.m
//  BlockLight
//
//  Created by Barrett Ames on 8/28/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "performerCell.h"

@implementation performerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withPerformer:(Performer*)performer
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
      UIImage* icon = [UIImage imageNamed:@"testImage.png"];
      UIImageView * iconPos = [[UIImageView alloc] initWithImage:icon];
      iconPos.frame = CGRectMake(50, 8, 165, 136);
      
      UILabel* performerName = [[UILabel alloc] initWithFrame:CGRectMake(225, 10, 350, 25)];
      performerName.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
      performerName.text = performer.name;
      performerName.textColor = [UIColor whiteColor];
      performerName.backgroundColor =[UIColor clearColor];
      
      UILabel* role = [[UILabel alloc] initWithFrame:CGRectMake(225, 30, 350, 25)];
      role.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
      role.text = [NSString stringWithFormat: @"Role: %@", performer.role ];
      role.textColor = [UIColor blackColor];
      role.backgroundColor =[UIColor clearColor];
      
      UILabel* stagePresence = [[UILabel alloc] initWithFrame:CGRectMake(225, 50, 350, 25)];
      stagePresence.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
      stagePresence.text = [NSString stringWithFormat: @"Stage Presence:%@", performer.stagePresence ];
      stagePresence.textColor = [UIColor blackColor];
      stagePresence.backgroundColor =[UIColor clearColor];
      
      UILabel* gender   = [[UILabel alloc]  initWithFrame:CGRectMake(225, 70, 350, 25)];
      gender.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
      gender.text = [NSString stringWithFormat:@"Gender:%@", performer.gender]; 
      gender.textColor = [UIColor blackColor];
      gender.backgroundColor = [UIColor clearColor];
      
      UILabel* voice = [[UILabel alloc] initWithFrame:CGRectMake(225, 90, 350, 25)];
      voice.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
      voice.text = [ NSString stringWithFormat:@"Voice:%@",performer.voice ];
      voice.textColor = [UIColor blackColor];
      voice.backgroundColor = [UIColor clearColor];
      
      UILabel* height = [[UILabel alloc] initWithFrame:CGRectMake(475, 30, 350, 25)];
      height.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
      height.text = [ NSString stringWithFormat:@"Height:%@",performer.height];
      height.textColor = [UIColor blackColor];
      height.backgroundColor = [UIColor clearColor];
      
      UILabel* phone = [[UILabel alloc] initWithFrame:CGRectMake(475, 50, 350, 25)];
      phone.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
      phone.text = [ NSString stringWithFormat:@"Phone Number:%@",performer.phoneNumber];
      phone.textColor = [UIColor blackColor];
      phone.backgroundColor = [UIColor clearColor];
      
      UILabel* email = [[UILabel alloc] initWithFrame:CGRectMake(475, 70, 350, 25)];
      email.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
      email.text = [ NSString stringWithFormat:@"Email:%@",performer.email];
      email.textColor = [UIColor blackColor];
      email.backgroundColor = [UIColor clearColor];
      
      UILabel* notes = [[UILabel alloc] initWithFrame:CGRectMake(475, 90, 350, 25)];
      notes.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
      notes.text = [ NSString stringWithFormat:@"Notes:%@",performer.notes];
      notes.textColor = [UIColor blackColor];
      notes.backgroundColor = [UIColor clearColor];
      
      [self addSubview:phone];
      [self addSubview:email];
      [self addSubview:notes]; 
      [self addSubview:performerName];
      [self addSubview:role];
      [self addSubview:stagePresence];
      [self addSubview:gender];
      [self addSubview:voice];
      [self addSubview:iconPos];
      [self addSubview:height];
      
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

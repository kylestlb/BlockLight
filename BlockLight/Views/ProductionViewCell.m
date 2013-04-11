//
//  ProductionViewCell.m
//  BlockLight
//
//  Created by Barrett Ames on 8/15/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "ProductionViewCell.h"

@implementation ProductionViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andViewController:(id)viewController andProduction:(Production*)production andRow:(NSInteger)row
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
    UIImage* icon = [UIImage imageNamed:@"testImage.png"];
    UIImageView * iconPos = [[UIImageView alloc] initWithImage:icon];
    iconPos.frame = CGRectMake(50, 8, 165, 136);
    
    UILabel* groupName = [[UILabel alloc] initWithFrame:CGRectMake(225, 10, 350, 25)];
    groupName.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    groupName.text = production.name;
    groupName.textColor = [UIColor whiteColor];
    groupName.backgroundColor =[UIColor clearColor];
    
    UILabel* productionDate = [[UILabel alloc] initWithFrame:CGRectMake(225, 30, 350, 25)];
    productionDate.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    productionDate.text = [NSString stringWithFormat:@"Production Date:%@", production.date ];
    productionDate.textColor = [UIColor blackColor];
    productionDate.backgroundColor =[UIColor clearColor];
    
    UILabel* location = [[UILabel alloc] initWithFrame:CGRectMake(225, 50, 350, 25)];
    location.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    location.text = [NSString stringWithFormat:@"Location:%@", production.location ];
    location.textColor = [UIColor blackColor];
    location.backgroundColor =[UIColor clearColor];
    
    UILabel* stageManager = [[UILabel alloc]  initWithFrame:CGRectMake(225, 70, 350, 25)];
    stageManager.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    stageManager.text = [NSString stringWithFormat:@"Stage Manager:%@", production.stageManager];
    stageManager.textColor = [UIColor blackColor];
    stageManager.backgroundColor = [UIColor clearColor];
    
    
    UIButton* editProd = [UIButton buttonWithType:UIButtonTypeCustom];
    editProd.frame = CGRectMake(520, 20, 125, 25);
    [editProd setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    editProd.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] ;
    [editProd setTitle:@"edit production" forState:UIControlStateNormal];
    editProd.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:15];
    editProd.titleLabel.textColor = [UIColor whiteColor];
    editProd.layer.cornerRadius = 7.0f;
    editProd.layer.shadowColor = [UIColor grayColor].CGColor;
    editProd.layer.shadowOffset = CGSizeMake(0, 1);
    editProd.tag = row; 
    [editProd addTarget:viewController action:@selector(editProduction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* export = [UIButton buttonWithType:UIButtonTypeCustom];
    export.frame = CGRectMake(520, 55, 125, 25);
    [export setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    export.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] ;
    [export setTitle:@"export" forState:UIControlStateNormal];
    export.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:15];
    export.titleLabel.textColor = [UIColor whiteColor];
    export.layer.cornerRadius = 7.0f;
    export.layer.shadowColor = [UIColor grayColor].CGColor;
    export.layer.shadowOffset = CGSizeMake(0, 1);
    
    UIButton* archive = [UIButton buttonWithType:UIButtonTypeCustom];
    archive.frame = CGRectMake(520, 90, 125, 25);
    [archive setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    archive.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] ;
    [archive setTitle:@"archive" forState:UIControlStateNormal];
    archive.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:15];
    archive.titleLabel.textColor = [UIColor whiteColor];
    archive.layer.cornerRadius = 7.0f;
    archive.layer.shadowColor = [UIColor grayColor].CGColor;
    archive.layer.shadowOffset = CGSizeMake(0, 1);
    
    
    [self addSubview:groupName];
    [self addSubview:productionDate];
    [self addSubview:location];
    [self addSubview:stageManager];
    [self addSubview:iconPos];
    [self addSubview:editProd];
    [self addSubview:export];
    [self addSubview:archive]; 
  }
  return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
  if(selected)
    self.backgroundColor =[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:.5];
  else
    self.backgroundColor =[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:.5];
  
}

@end

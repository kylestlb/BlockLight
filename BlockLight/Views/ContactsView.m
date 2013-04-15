//
//  ContactsView.m
//  BlockLight
//
//  Created by Barrett Ames on 8/16/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "ContactsView.h"

@implementation ContactsView

@synthesize filterBy = _filterBy;
@synthesize addGroup = _addGroup;
@synthesize editGroup = _editGroup;
@synthesize addMember = _addMember;


- (id)initWithDelegate:(id)viewController 
{
    self = [super init];
    if (self) {

      UIView* line = [[UIView alloc] initWithFrame:CGRectMake(25, 250, 650, 2)];
      line.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.8f];
      
      UILabel* filter = [[UILabel alloc] initWithFrame:CGRectMake(25, 220, 100, 25)];
      filter.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
      filter.text = @"Filter By:";
      filter.backgroundColor = [UIColor clearColor];
      filter.textColor = [UIColor whiteColor];
      
      _filterBy = [UIButton buttonWithType:UIButtonTypeCustom];
      _filterBy.frame = CGRectMake(105, 221, 100, 25);
      [_filterBy setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
      _filterBy.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] ;
      [_filterBy setTitle:@"Group Name" forState:UIControlStateNormal];
      _filterBy.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:15];
      _filterBy.titleLabel.textColor = [UIColor whiteColor];
      _filterBy.layer.cornerRadius = 7.0f;
      _filterBy.layer.shadowColor = [UIColor grayColor].CGColor;
      _filterBy.layer.shadowOffset = CGSizeMake(0, 1);
      [_filterBy addTarget:viewController action:@selector(filterBy) forControlEvents:UIControlEventTouchUpInside];
      
      _addGroup = [UIButton buttonWithType:UIButtonTypeCustom];
      _addGroup.frame = CGRectMake(20, 700, 100, 25);
      [_addGroup setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
      _addGroup.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] ;
      [_addGroup setTitle:@"Add Group" forState:UIControlStateNormal];
      _addGroup.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:15];
      _addGroup.titleLabel.textColor = [UIColor whiteColor];
      _addGroup.layer.cornerRadius = 7.0f;
      _addGroup.layer.shadowColor = [UIColor grayColor].CGColor;
      _addGroup.layer.shadowOffset = CGSizeMake(0, 1);
      [_addGroup addTarget:viewController action:@selector(addGroupPopover) forControlEvents:UIControlEventTouchUpInside];
      
      
      _editGroup = [UIButton buttonWithType:UIButtonTypeCustom];
      _editGroup.frame = CGRectMake(295, 700, 100, 25);
      [_editGroup setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
      _editGroup.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] ;
      [_editGroup setTitle:@"Edit Group" forState:UIControlStateNormal];
      _editGroup.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:15];
      _editGroup.titleLabel.textColor = [UIColor whiteColor];
      _editGroup.layer.cornerRadius = 7.0f;
      _editGroup.layer.shadowColor = [UIColor grayColor].CGColor;
      _editGroup.layer.shadowOffset = CGSizeMake(0, 1);
      
      _addMember = [UIButton buttonWithType:UIButtonTypeCustom];
      _addMember.frame = CGRectMake(580, 700, 100, 25);
      [_addMember setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
      _addMember.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] ;
      [_addMember setTitle:@"Add Member" forState:UIControlStateNormal];
      _addMember.titleLabel.font =[UIFont fontWithName:@"Helvetica" size:15];
      _addMember.titleLabel.textColor = [UIColor whiteColor];
      _addMember.layer.cornerRadius = 7.0f;
      _addMember.layer.shadowColor = [UIColor grayColor].CGColor;
      _addMember.layer.shadowOffset = CGSizeMake(0, 1);
      [_addMember addTarget:viewController action:@selector(addMemberPopover) forControlEvents:UIControlEventTouchUpInside]; 
      
      [self addSubview:line];
      [self addSubview:filter];
      [self addSubview:_addGroup];
      [self addSubview:_editGroup];
      [self addSubview:_addMember];
      [self addSubview:_filterBy];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

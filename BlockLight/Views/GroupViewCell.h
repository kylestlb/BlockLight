//
//  GroupViewCell.h
//  BlockLight
//
//  Created by Barrett Ames on 8/11/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Group.h"

@interface GroupViewCell : UITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andGroup:(Group*)group; 

@end

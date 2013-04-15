//
//  performerCell.h
//  BlockLight
//
//  Created by Barrett Ames on 8/28/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Performer.h"
@interface performerCell : UITableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withPerformer:(Performer*)performer; 
@end

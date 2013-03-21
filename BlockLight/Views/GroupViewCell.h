//
//  GroupViewCell.h
//  BlockLight
//
//  Created by Barrett Ames on 8/15/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Production.h"

@interface GroupViewCell : UITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andViewController:(id)viewController andProduction:(Production*)production andRow:(NSInteger)row; 

@end

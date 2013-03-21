//
//  GridTableViewCell.h
//  BlockLight
//
//  Created by Barrett Ames on 8/1/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridTableViewCell : UITableViewCell {
	//UIColor *lineColor;
	//BOOL topCell;
	UIView *cell1;
	UIView *cell2;
	UIView *cell3;
}
//@property (nonatomic, retain) UIColor* lineColor;
//@property (nonatomic) BOOL topCell;
@property (strong) UIView* cell1;
@property (strong) UIView* cell2;
@property (strong) UIView* cell3;

@end
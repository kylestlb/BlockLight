//
//  DummyMainView.h
//  BlockLight
//
//  Created by Kyle St. Leger-Barter on 3/20/13.
//  Copyright (c) 2013 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DummyMainView : UIView{
	
	BOOL _horizontalGrid ;
	BOOL _verticalGrid;
	BOOL _grid;
	BOOL _spikeTape;
	UIBezierPath *_myPath;
	UIColor *brushPattern;
	UILabel* _note;
	BOOL first;
	
	CGFloat _opacity;
	
}

@property BOOL horizontalGrid;
@property BOOL verticalGrid;
@property BOOL grid;
@property BOOL spikeTape;
@property (strong) UIBezierPath* myPath;
@property CGFloat opacity;
@property UILabel* noteLabel;

- (id) initWithFrame:(CGRect)frame andViewController:(id)viewController;

@end

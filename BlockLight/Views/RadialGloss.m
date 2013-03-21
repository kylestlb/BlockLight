//
//  RadialGloss.m
//  BlockLight
//
//  Created by Barrett Ames on 8/6/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "RadialGloss.h"

@implementation RadialGloss

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     // self.backgroundColor = [UIColor colorWithRed:.6352 green:.1058 blue:.2078 alpha:1.0];
    // self.opaque = NO;
    //  self.clipsToBounds = YES;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
  NSInteger inset = 8;
  frame.origin.x += inset;
  frame.size.width -= 2 * inset;
  [super setFrame:frame];
}

/*- (void)drawRect:(CGRect)rect
{
  CGContextRef currentContext = UIGraphicsGetCurrentContext();
  
  CGGradientRef glossGradient;
  CGColorSpaceRef rgbColorspace;
  size_t num_locations = 2;
  CGFloat locations[2] = { 0.0, 1.0 };
  CGFloat components[8] = { 1.0, 1.0, 1.0, 0.25,  // Start color
    1.0, 1.0, 1.0, 0.03 }; // End color
  //{ .5686, .0823, .1646, 1,  // Start color
  // .7843, .149, .29, 0.1 };
  
  rgbColorspace = CGColorSpaceCreateDeviceRGB();
  glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);
  
  CGRect currentBounds = self.bounds;
  CGPoint topCenter = CGPointMake(CGRectGetMidX(currentBounds), 0.0f);
  CGPoint midCenter = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMidY(currentBounds));
  CGContextDrawRadialGradient(currentContext, glossGradient, midCenter, 0, midCenter, 0.75*currentBounds.size.width, 0);
  //CGContextDrawRadialGradient(currentContext, glossGradient)
  //CGContextDrawLinearGradient(currentContext, glossGradient, topCenter, midCenter, 0);
  
  CGGradientRelease(glossGradient);
  CGColorSpaceRelease(rgbColorspace);
} */

@end

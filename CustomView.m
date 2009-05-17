//
//  CustomView.m
//  CoverDesktop
//
//  Created by soh kitahara on 09/05/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
- (void)setImage:(NSImage *)_image {
	image = _image;
}
- (void)drawRect:(NSRect)rect {
	[image compositeToPoint:NSZeroPoint operation:NSCompositeSourceOver];
}
@end

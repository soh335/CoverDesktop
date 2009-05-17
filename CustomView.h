//
//  CustomView.h
//  CoverDesktop
//
//  Created by soh kitahara on 09/05/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CustomView : NSView {
	NSImage *image;
}
- (void)setImage:(NSImage *)_image;
@end

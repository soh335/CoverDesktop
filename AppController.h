//
//  AppController.h
//  CoverDesktop
//
//  Created by soh kitahara on 09/05/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CustomView;
@interface AppController : NSObject {
	IBOutlet NSMenu* _status_menu;
	NSStatusItem* _status_item;
	NSWindow *window;
	CustomView *view;
	NSImage *image;
}
- (IBAction)refresh:(id)sender;
- (void) start;
- (void) coverDesktop;
@end

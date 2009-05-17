//
//  AppController.m
//  CoverDesktop
//
//  Created by soh kitahara on 09/05/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"
#import "CustomView.h"
#import "Window.h"

@implementation AppController
- (void)start {
	[self coverDesktop];
}

- (void)coverDesktop {
	NSRect main = [[NSScreen mainScreen] frame];
	window = [[NSWindow alloc] initWithContentRect:main styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO];
	[window setBackgroundColor:[NSColor clearColor]];
	[window setOpaque:NO];
	[window setHasShadow:NO];
	[window setLevel:CGWindowLevelForKey(kCGDesktopIconWindowLevelKey)];
	[window makeKeyAndOrderFront:self];
	
	CGImageRef screenShot = CGWindowListCreateImage(CGRectInfinite, kCGWindowListOptionIncludingWindow, [Window desktopWindowID], kCGWindowImageDefault);
	float width = CGImageGetWidth(screenShot), height = CGImageGetHeight(screenShot);
	image = [[NSImage alloc] initWithSize:NSMakeSize(width, height)];
	[image lockFocus];
	CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
	CGContextDrawImage(context, CGRectMake(0, 0, width, height), screenShot);
	[image unlockFocus];
	
	view = [[CustomView alloc] initWithFrame:main];
	[view setImage:image];
	[window setContentView:view];
	[view setNeedsDisplay:YES];
	
	CGImageRelease(screenShot);
}

- (IBAction)refresh:(id)sender {
	[image release];
	[view release];
	[window release];
	[self coverDesktop];
	
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSStatusBar *status_bar = [NSStatusBar systemStatusBar];
	_status_item = [status_bar statusItemWithLength:NSVariableStatusItemLength];
	[_status_item retain];
	[_status_item setTitle:@"C"];
	[_status_item setHighlightMode:YES];
	[_status_item setMenu:_status_menu];
	[self start];
}
@end

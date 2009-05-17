//
//  Window.m
//
// http://xcatsan.blogspot.com/2008/09/blog-post_1320.html
//

#import "Window.h"


@implementation Window
static int _desktop_windowID = -1;

+ (CGWindowID)desktopWindowID
{
	if (_desktop_windowID != -1) {
		return _desktop_windowID;
	}
	
	CFArrayRef ar = CGWindowListCopyWindowInfo(kCGWindowListOptionOnScreenOnly, kCGNullWindowID);
	CFDictionaryRef window;
	CFIndex i;
	
	_desktop_windowID = kCGNullWindowID;
	for (i=0; i < CFArrayGetCount(ar); i++) {
		window = CFArrayGetValueAtIndex(ar, i);
		NSString* name = (NSString*)CFDictionaryGetValue(window, kCGWindowName);
		NSString* owner_name = (NSString*)CFDictionaryGetValue(window, kCGWindowOwnerName);
		if ([name isEqualToString:@"Desktop"] && [owner_name isEqualToString:@"Window Server"]) {
			CFNumberGetValue(CFDictionaryGetValue(window, kCGWindowNumber),
							 kCGWindowIDCFNumberType, &_desktop_windowID);
			break;
		}
	}
	return _desktop_windowID;
}
@end

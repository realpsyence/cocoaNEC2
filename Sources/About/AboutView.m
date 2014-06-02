//
//  AboutView.m

#import "AboutView.h"
#import "Versions.h"

@implementation AboutView

- (void)drawRect:(NSRect)rect 
{
	NSBezierPath *background ;
	NSString *version ;
	
	if ( [ self lockFocusIfCanDraw ] ) {
		[ [ NSColor whiteColor ] set ] ;
		background = [ NSBezierPath bezierPathWithRect:[ self bounds ] ] ;
		[ background fill ] ;
		[ self unlockFocus ] ;
	}

	[ super drawRect:rect ] ;
	
	if ( [ self lockFocusIfCanDraw ] ) {
		//  set version string in About panel
		version = [ [ NSBundle mainBundle ] objectForInfoDictionaryKey:@"CFBundleVersion" ] ;
		if ( version ) {
			#if ( BuildForSnowLeopard )
			[ versionString setStringValue:[ NSString stringWithFormat:@"Version %s (SL)", [ version UTF8String ] ] ] ;
			#else
			[ versionString setStringValue:[ NSString stringWithFormat:@"Version %s", [ version UTF8String ] ] ] ;
			#endif
		}
		[ self unlockFocus ] ;
	}
}

@end

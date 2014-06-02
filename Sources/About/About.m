//
//  About.m
//  cocoaNEC

#import "About.h"


@implementation About

- (id)init
{
	self = [ super init ] ;
	if ( self ) {
		[ NSBundle loadNibNamed:@"About" owner:self ] ;
	}
	return self ;
}

- (void)showPanel
{
	if ( window ) {
		[ window center ] ;
		[ window orderFront:nil ] ;
	}
}

@end

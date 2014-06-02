//
//  ColumnScale.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/20/07.

	#import <Cocoa/Cocoa.h>


	@interface ColumnScale : NSView {
		NSRect frame ;
		NSRect bounds ;
		NSBezierPath *scale ;
		float width, height ;
	}

	- (void)setGrid:(float)advance ;

	@end

//
//  WireCurrent.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/15/12.
//  Copyright 2012 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OutputGeometryElement.h" ;

@interface WireCurrent : NSView <NSWindowDelegate> {
	IBOutlet NSPopUpButton *currentTypeMenu ;
	NSArray *geometryArray ;
	NSColor *backgroundColor, *gridColor, *plotColor, *alphaColor ;
	int segmentOffset ;
	Boolean isActive ;
}

- (void)newInfo:(GeometryInfo*)segment array:(NSArray*)geometryArray ;
- (Boolean)active ;
- (void)setActive:(Boolean)state ;
- (void)hideWindow ;

@end

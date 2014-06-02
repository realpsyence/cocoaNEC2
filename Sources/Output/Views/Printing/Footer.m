//
//  Footer.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/20/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "Footer.h"
#import "Output.h"

@implementation Footer

- (id)initWithFrame:(NSRect)inFrame
{
	self = [ super initWithFrame:inFrame ] ;
	if ( self ) {
		output = nil ;
	}
	return self ;
}

- (void)setOutput:(Output*)obj
{
	output = obj ;
}

- (void)drawRect:(NSRect)rect
{
	NSMutableDictionary *printAttributes ;
	NSFont *font = [ NSFont fontWithName: @"Helvetica" size:10 ] ;
	float height ;

	if ( output && [ output drawFilenames ] && font != nil ) {
		height = [ self bounds ].size.height ;
		printAttributes = [ [ NSMutableDictionary alloc ] init ] ;
		[ printAttributes setObject:font forKey:NSFontAttributeName ] ;
		[ printAttributes setObject:[ NSColor blackColor ] forKey:NSForegroundColorAttributeName ] ;
		[ [ NSString stringWithFormat:@"%s", [ output filename ] ] drawAtPoint:NSMakePoint( 5, height-20 ) withAttributes:printAttributes ] ;
		[ [ NSString stringWithFormat:@"%s", [ [ [ NSCalendarDate calendarDate ] descriptionWithCalendarFormat:@"%A %d %b %Y %H:%M" ] UTF8String ] ] drawAtPoint:NSMakePoint( 5, height-35 ) withAttributes:printAttributes ] ;
		[ printAttributes release ] ;
	}
}

@end

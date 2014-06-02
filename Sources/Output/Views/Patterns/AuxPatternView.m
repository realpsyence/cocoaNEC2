//
//  AuxPatternView.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/17/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "AuxPatternView.h"
#import "ApplicationDelegate.h"
#import "Output.h"
#import "OutputTypes.h"

@implementation AuxPatternView

- (void)showCaption:(NSArray*)element index:(int)index
{
	int i, j, color ;
	float top, left ;
	NSPoint point ;
	NSRect bounds ;
	NSString *string ;
	Output *output ;
	
	//  element is an array of 1)  an NSString and 2) a color index
	//	the color index is -1 for black (refererence)
	string = [ element objectAtIndex:0 ] ;
	color = [ [ element objectAtIndex:1 ] intValue ] ;
	output = [ [ NSApp delegate ] output ] ;
	
	bounds = [ self bounds ] ;
	top = bounds.size.height - 16 ;
	left = 11 ;
	
	j = top - ( index % 3 )*15 ;
	i = left + ( index / 3 )*150 ;
	point = NSMakePoint( i+16, j ) ;
	[ string drawAtPoint:point withAttributes:[ output smallFontAttributes ] ] ;
	
	if ( color < 0 || color >= MAXCOLORWELLS ) [ [ NSColor blackColor ] set ] ; else [ colors[color] set ] ; 
	[ NSBezierPath fillRect:NSMakeRect( i, j+1, 10, 10 ) ] ;
}

- (void)drawRect:(NSRect)rect
{
	NSBezierPath *framePath ;
	NSRect bounds ;
	Boolean isScreen ;
	int i, n ;
	
	bounds = [ self bounds ] ;
	framePath = [ NSBezierPath bezierPathWithRect:bounds ] ;
	isScreen = [ NSGraphicsContext currentContextDrawingToScreen ] ;
	if ( !isScreen && drawInfoForOffScreen == NO ) return ;
	
	//  clear area and frame it  
	[ [ NSColor whiteColor ] set ] ; 
	[ framePath fill ] ; 
	if ( [ [ [ NSApp delegate ] output ] drawBorders ] ) {
		[ [ NSColor blackColor ] set ] ; 
		[ framePath stroke ] ;
	}
	if ( captionArray ) {
		n = [ captionArray count ] ;
		if ( n > 12 ) n = 12 ;
		for ( i = 0; i < n; i++ ) [ self showCaption:[ captionArray objectAtIndex:i ] index:i ] ;
	}	
}

- (void)show:(NSArray*)array colors:(NSColor**)plotColors
{
	[ captionArray removeAllObjects ] ;
	[ captionArray addObjectsFromArray:array ] ;
	colors = plotColors ;
	[ self setNeedsDisplay:YES ] ;
}

- (id)initWithFrame:(NSRect)inFrame
{
    self = [ super initWithFrame:inFrame ] ;
	if ( self ) {
		captionArray = [ [ NSMutableArray alloc ] init ] ;
	}
	return self ;
}

- (void)dealloc
{
	[ captionArray release ] ;
	[ super dealloc ] ;
}

@end

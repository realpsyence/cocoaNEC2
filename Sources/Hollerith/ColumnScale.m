//
//  ColumnScale.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/20/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "ColumnScale.h"


@implementation ColumnScale

- (id)initWithFrame:(NSRect)inFrame 
{
	NSSize size ;

    self = [ super initWithFrame:inFrame ] ;
    if ( self ) {
	
		frame = inFrame ;
		bounds = [ self bounds ] ;
		size = bounds.size ;
		width = size.width ;
		height = size.height ;
		
		scale = nil ;
		[ self setGrid:( 7.80127+1.085449 ) ] ;  // advance and leading
	}
	return self ;
}

- (void)setGrid:(float)advance
{
	float x, t, base, longTick, shortTick, mediumTick, tick ;
	int i, n ;
	
	advance *= ( 72.0/80.0 ) ;
	
	x = 4 ;
	base = 0 ;
	shortTick = height*0.25 ;
	mediumTick = height*0.45 ;
	longTick = height*0.7 ;
	
	if ( scale ) [ scale release ] ;		
	scale = [ [ NSBezierPath alloc ] init ] ;
	[ scale setLineWidth: 0.5 ] ;
	for ( i = 0; i < 81; i++ ) {
		tick = shortTick ;
		if ( ( i % 10 ) == 0 ) tick = longTick ; 
		else {
			if ( i < 20 && ( i%5 ) == 0 ) tick = mediumTick ;
		}
		n = x + 0.5 ;
		t = n + 0.5 ;
		[ scale moveToPoint:NSMakePoint( t, base ) ] ;
		[ scale lineToPoint:NSMakePoint( t, tick ) ] ;
		x += advance ;
	}
	[ self setNeedsDisplay:YES ] ;
}

- (void)drawRect:(NSRect)frame
{
	if ( [ self lockFocusIfCanDraw ] ) {
		//  insert scale
		[ [ NSColor blackColor ] set ] ;
		[ scale stroke ] ;
		[ self unlockFocus ] ;
	}
}

@end

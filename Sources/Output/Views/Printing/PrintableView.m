//
//  PrintableView.m
//  cocoaNEC
//
//  Created by Kok Chen on 10/23/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "PrintableView.h"


@implementation PrintableView

- (id)initWithFrame:(NSRect)inFrame
{
	NSFont *verdana ;
	
	self = [ super initWithFrame:inFrame ] ;
	if ( self ) {
		verdana = [ NSFont fontWithName: @"Verdana" size: 10.0 ] ;
		if ( !verdana ) verdana = [ NSFont systemFontOfSize:10.0 ] ;
		infoAttributes = [ [ NSMutableDictionary alloc ] initWithCapacity:2 ] ;
		[ infoAttributes setObject:verdana forKey:NSFontAttributeName ] ;
		[ infoAttributes setObject:[ NSColor blackColor ] forKey:NSForegroundColorAttributeName ] ;
		textAttributes = [ [ NSMutableDictionary alloc ] initWithCapacity:2 ] ;
		[ textAttributes setObject:verdana forKey:NSFontAttributeName ] ;
		[ textAttributes setObject:[ NSColor blackColor ] forKey:NSForegroundColorAttributeName ] ;
	}
	return self ;
}

//  v0.81e called from Output.m and used by subclasses that needs to know whaen they are selected
- (void)viewSelected:(Boolean)state
{
}

- (void)dealloc
{
	[ infoAttributes release ] ;
	[ textAttributes release ] ;
	[ super dealloc ] ;
}

@end

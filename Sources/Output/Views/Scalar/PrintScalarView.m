//
//  PrintScalarView.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/23/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "PrintScalarView.h"


@implementation PrintScalarView


- (id)initWithFrame:(NSRect)rect
{
	self = [ super initWithFrame:rect ] ;
	if ( self ) {
		isScreen = NO ;
	}
	return self ;
}

- (void)awakeFromNib
{
	[ plotTypeMenu selectItemAtIndex:0 ] ;		//  choose RX
	scalarType = 0 ;
	[ self setRXScaleMenu ] ;
	[ self setScrollOffset:scalarScrollerLocation[ scalarType ] ] ;
}



@end

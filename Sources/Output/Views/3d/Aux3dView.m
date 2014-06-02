//
//  Aux3dView.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/21/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "Aux3dView.h"
#import "ApplicationDelegate.h"
#import "Output.h"
#import "Pattern3dView.h"

@implementation Aux3dView

- (void)drawRect:(NSRect)rect
{
	NSBezierPath *framePath ;
	NSRect bounds ;
	NSString *string ;
	Output *output ;
	Pattern3dView *base ;
	
	if ( [ NSGraphicsContext currentContextDrawingToScreen ] == YES ) return ;
	
	bounds = [ self bounds ] ;
	framePath = [ NSBezierPath bezierPathWithRect:bounds ] ;
	//  clear area and frame it  
	[ [ NSColor whiteColor ] set ] ; 
	[ framePath fill ] ; 
	output = [ [ NSApp delegate ] output ] ;
	if ( output ) {
		if ( [ output drawBorders ] ) {
			[ [ NSColor blackColor ] set ] ; 
			[ framePath stroke ] ;
		}
		base = [ output pattern3dView ] ;
		if ( base ) {
			string = [ NSString stringWithFormat:@"Azimuth angle = %.0f degrees", [ base angle ] ] ;
			[ string drawAtPoint:NSMakePoint( 8, [ self bounds ].size.height - 20 ) withAttributes:[ output mediumFontAttributes ] ] ;
		}
	}
}

@end

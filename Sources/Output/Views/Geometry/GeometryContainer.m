//
//  GeometryContainer.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/21/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "GeometryContainer.h"
#import "GeometryView.h"
#import "Output.h"


@implementation GeometryContainer

//	Container view that includes a GeometryView
//  Print header is added here

- (Boolean)setUpWithPrintInfo:(NSPrintInfo*)printInfo output:(Output*)output
{
	float viewOffset ;
	
	if ( geometryView == nil || footer == nil ) return NO ;
	
	if ( [ output drawFilenames ] ) {
		viewOffset = FILENAMEOFFSET ;
		[ self setOutput:output ] ;		//  to get printFooter callback from view's drawRect
	}
	else {
		viewOffset = 2 ;
		[ self setOutput:nil ] ;
	}
	[ self setFrame:NSMakeRect( 0, 0, 600., 601.0+viewOffset ) ] ;
	[ footer setFrame:NSMakeRect( 0, 0, 600., viewOffset ) ] ;
	
	[ printInfo setHorizontalPagination:NSFitPagination ] ;
	[ printInfo setVerticalPagination:NSClipPagination ] ;
	return YES ;
}

- (GeometryView*)geometryView
{
	return geometryView ;
}

@end

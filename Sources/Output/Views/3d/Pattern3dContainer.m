//
//  Pattern3dContainer.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/21/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "Pattern3dContainer.h"
#import "Output.h"
#import "Pattern3dView.h"

@implementation Pattern3dContainer

- (Boolean)setUpWithPrintInfo:(NSPrintInfo*)printInfo output:(Output*)output
{
	Pattern3dView *base ;
	float viewOffset, auxHeight ;
	
	if ( view == nil || auxView == nil || footer == nil ) return NO ;
	
	base = [ output pattern3dView ] ;
	[ view setAngle:[ base angle ] ] ;
	[ view setContrast:[ base contrast ] ] ;
	[ view setGainScale:[ base gainScale ] ] ;
	[ view setPlotType:[ base plotType ] ] ;
	[ view setPattern:[ base pattern ] ] ; 
	
	if ( [ output drawFilenames ] ) {
		viewOffset = FILENAMEOFFSET ;
		[ self setOutput:output ] ;		//  to get printFooter callback from view's drawRect
	}
	else {
		viewOffset = 2 ;
		[ self setOutput:nil ] ;
	}
	auxHeight = 25 ;
	[ self setFrame:NSMakeRect( 0, 0, 600., 600.+( auxHeight+1 )+viewOffset ) ] ;
	[ view setFrame:NSMakeRect( 0, ( auxHeight+1 )+viewOffset, 600., 600. ) ] ;
	[ auxView setFrame:NSMakeRect( 0, viewOffset, 600., auxHeight ) ] ;
	[ footer setFrame:NSMakeRect( 0, 0, 600., viewOffset ) ] ;
	
	[ printInfo setHorizontalPagination:NSFitPagination ] ;
	[ printInfo setVerticalPagination:NSClipPagination ] ;
	return YES ;
}

- (Pattern3dView*)view
{
	return view ;
}

@end

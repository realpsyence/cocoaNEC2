//
//  SWRContainer.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/20/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "SWRContainer.h"
#import "AuxSWRView.h"
#import "SWRView.h"
#import "Output.h"

@implementation SWRContainer

- (Boolean)setUpWithPrintInfo:(NSPrintInfo*)printInfo output:(Output*)output
{
	int i ;
	SWRView *baseSWRView ;
	AuxSWRView *aux ;
	float auxHeight, viewOffset ;
	
	baseSWRView = [ output swrView ] ;
	aux = [ self auxView ] ;
	if ( swrView == nil || aux == nil || footer == nil ) return NO ;
	
	auxHeight = [ aux bounds ].size.height ;
	
	if ( [ output drawFilenames ] ) {
		viewOffset = FILENAMEOFFSET ;
		[ self setOutput:output ] ;		//  to get printFooter callback from view's drawRect
	}
	else {
		viewOffset = 0 ;
		[ self setOutput:nil ] ;
	}
	[ self setFrame:NSMakeRect( 0, 0, 600., 600.+( auxHeight+1 )+viewOffset ) ] ;
	[ swrView setFrame:NSMakeRect( 0, ( auxHeight+1 )+viewOffset, 600., 600. ) ] ;
	[ [ self auxView ] setFrame:NSMakeRect( 0, viewOffset, 600., auxHeight ) ] ;
	[ footer setFrame:NSMakeRect( 0, 0, 600., viewOffset ) ] ;

	//  copy needed data from GUI SWRView to the printing SWRView
	[ swrView setFeedpointForOffscreenView:[ baseSWRView selectedFeedpointFromMenu ] ] ;
	for ( i = 0; i < 16; i++ ) [ swrView setColorWell:i fromColorWell:[ baseSWRView colorWell:i ] ] ;
	[ printInfo setHorizontalPagination:NSFitPagination ] ;
	return YES ;
}

- (SWRView*)swrView
{
	return swrView ;
}

- (AuxSWRView*)auxView
{
	if ( swrView == nil ) return nil ;
	return [ swrView auxView ] ;
}

@end

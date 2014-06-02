//
//  LineprinterContainer.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/22/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "LineprinterContainer.h"
#import "Output.h"

@implementation LineprinterContainer

- (Boolean)setUpWithPrintInfo:(NSPrintInfo*)printInfo output:(Output*)output
{
	NSTextContainer *container ;
	NSString *listing ;
	
	listing = [ output savedListing ] ;
	if ( textView == nil || listing == nil ) return NO ;
	
	[ printInfo setHorizontalPagination:NSFitPagination ] ;
	[ printInfo setHorizontallyCentered:NO ] ;
	[ printInfo setVerticallyCentered:NO ] ;
	
	[ textView setFont:[ NSFont fontWithName: @"Monaco" size:10.0 ] ] ;
	container = [ textView textContainer ] ;
	[ container setContainerSize:NSMakeSize( 700.0, 1e12 ) ] ;		//  multiple pages
 	[ container setHeightTracksTextView:NO ] ;
	[ textView sizeToFit ] ;
	[ textView setString:listing ] ;
	[ textView print:self ] ;			//  print text view, not the container
	return NO ;							//  no need to print from -printWithInfo:Output:
}

@end

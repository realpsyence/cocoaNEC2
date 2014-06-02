//
//  SummaryContainer.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/20/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "SummaryContainer.h"
#import "ApplicationDelegate.h"
#import "Output.h"


@implementation SummaryContainer

- (void)awakeFromNib
{
	[ azimuth setIsEmbedded:YES ] ;
	[ elevation setIsEmbedded:YES ] ;
}

- (Boolean)setUpWithPrintInfo:(NSPrintInfo*)printInfo output:(Output*)output
{
	float summaryHeight ;
	
	if ( azimuth == nil || elevation == nil || textView == nil ) return NO ;
	
	//  no filename for summary view
	[ self setOutput:nil ] ;

	summaryHeight = 311 ;
	[ self setFrame:NSMakeRect( 0, 0, 597, 313.0+( summaryHeight+1 ) ) ] ;
	[ azimuth setFrame:NSMakeRect( 0, ( summaryHeight+1 ), 298, 313 ) ] ;
	[ elevation setFrame:NSMakeRect( 299, ( summaryHeight+1 ), 298, 313 ) ] ;
	[ [ textView enclosingScrollView ] setFrame:NSMakeRect( 10, 1, 598-15, summaryHeight ) ] ;	//  note: resize enclosing scrollview
		
	[ printInfo setHorizontalPagination:NSFitPagination ] ;
	[ printInfo setVerticalPagination:NSClipPagination ] ;
	return YES ;
}

- (PatternView*)azimuthPattern
{
	return azimuth ;
}

- (PatternView*)elevationPattern
{
	return elevation ;
}

- (NSTextView*)textView
{
	return textView ;
}

- (void)clearText
{
	[ textView setString:@"" ] ;
}

- (void)appendText:(NSString*)string
{
	NSAttributedString *astring ;
	
	astring = [ [ NSAttributedString alloc ] initWithString:string ] ;
	[ [ textView textStorage ] appendAttributedString:astring ] ;
	[ astring release ] ;	
}

//	pass colors on to subviews
- (void)updateColorsFromColorWells:(ColorWells*)wells
{
	[ azimuth updateColorsFromColorWells:wells ] ;
	[ elevation updateColorsFromColorWells:wells ] ;
}

//	pass color on to subviews
- (void)changeColor:(NSColorWell*)well
{
	[ azimuth changeColor:well ] ;
	[ elevation changeColor:well ] ;
}

//  pass data on to azimuth view
- (void)updateAzimuthPatternWithArray:(NSArray*)array refArray:(NSArray*)ref prevArray:(NSArray*)prev
{
	[ azimuth updatePatternWithArray:array refArray:ref prevArray:prev ] ;
}

//  pass data on to elevation view
- (void)updateElevationPatternWithArray:(NSArray*)array refArray:(NSArray*)ref prevArray:(NSArray*)prev
{
	[ elevation updatePatternWithArray:array refArray:ref prevArray:prev ] ;
}

//  clear all pattern arrays
- (void)clearPatterns
{
	[ azimuth updatePatternWithArray:nil refArray:nil prevArray:nil ] ;
	[ elevation updatePatternWithArray:nil refArray:nil prevArray:nil ] ;
}

- (void)drawRect:(NSRect)rect
{
	if ( [ [ [ NSApp delegate ] output ] drawBorders ] ) {
		[ [ NSColor blackColor ] set ] ; 
		[ [ NSBezierPath bezierPathWithRect:rect ] stroke ] ;
	}
}

@end

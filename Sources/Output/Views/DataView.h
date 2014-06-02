//
//  DataView.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/7/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Output.h"
#import "OutputContext.h"
#import "OutputTypes.h"
#import "pdfConsumer.h"
#import "PrintableView.h"

#define	MAXSWEEP		1024
#define	MAXFEEDPOINTS	64		//  allow up to 64 feedpoints per antenna

//  for each frequency, this lists the (zr,zi) pairs for each of the feedpoint from i...(feedpoints-1)
typedef struct {
	float frequency ;
	int feedpoints ;
	float zr[MAXFEEDPOINTS] ;
	float zx[MAXFEEDPOINTS] ;
} FeedpointList ;

//	RXFArray is used for sorting in case the addFrequency() calls are not in ascending order.
typedef RXF		RXFArray[MAXSWEEP] ;

@interface DataView : PrintableView {
	IBOutlet NSPopUpButton *feedPoint ;
	IBOutlet Output *outputObject ;
	IBOutlet NSButton *interpolateCheckbox ;

	CGContextRef context ;
	int numberOfFrequencies ;
	int numberOfFeedpoints ;
	int selectedFeedpointNumber ;
	FeedpointList feedpointList[MAXSWEEP] ;
	FeedpointList refFeedpoint ;
	RXFArray rxfArray[MAXFEEDPOINTS] ;
	OutputContext *outputContext ;
	float z0 ;
	Boolean isScreen ;
	float opticalScale ;
	
	//  donut interior
	NSColor *donutHoleColor, *white ;
	//	v0.70 offscreen feedpoint "menu" index
	int offscreenFeedpointMenuIndex ;
}

- (void)updateWithContext:(OutputContext*)outputContext refContext:(OutputContext*)refContext z0:(float)refz ;

- (void)updateFeedpointFromOutputContext ;
- (int)selectedFeedpointFromMenu ;
- (void)setFeedpointForOffscreenView:(int)index ;
- (int)setupFeedpointMenu ;

- (float)makeOpticalScale:(NSRect)bounds ;
- (float)z0 ;

- (void)sort:(RXF*)rxf samples:(int)n ;
- (void)setInterpolate:(Boolean)state ;
- (Boolean)doInterpolate ;

- (void)drawPoint:(PDFConsumer*)p x:(float)x y:(float)y radius:(float)r ;
- (void)drawSelectedPoint:(PDFConsumer*)p x:(float)x y:(float)y radius:(float)r ;

//  utility functions
void RXtoUV( float rtmp, float xtmp, float *u, float *v ) ;
void UVtoRX( float u, float v, float *r, float *x ) ;
float pointDist( NSPoint a, NSPoint b ) ;

@end

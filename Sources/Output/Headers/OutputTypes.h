/*
 *  OutputTypes.h
 *  cocoaNEC
 *
 *  Created by Kok Chen on 6/17/11.
 *  Copyright 2011 Kok Chen, W7AY. All rights reserved.
 *
 */

#define	MAXCOLORWELLS	16

typedef struct {
	int numberOfWells ;
	NSColorWell *colorWell[MAXCOLORWELLS] ;
} ColorWells ;

typedef struct {
	Boolean hasData ;
	float width ;
	float height ;
	float minFreq ;
	float maxFreq ;
	float decade ;
	float pixelsPerFrequencyGrid, firstFrequencyGrid ;
	float frequencyLabelGrid, firstFrequencyLabel ;
	NSString *labelFormat ;
	int y0, dataOffset, pixelsPerMinorVerticalGrid, pixelsPerVerticalGrid ;
	float unitsPerVerticalGrid ;
} PlotInfo ;

//	RX, UV, frequency and presorted index and feedpointNumber for each element of RXFArray in Dataview.h.
typedef struct {
	NSPoint rx ;
	NSPoint uv ;
	NSPoint viewLocation ;
	float frequency ;
	int index ;					//  presorted index
	int frequencyIndex ;
} RXF ;

typedef struct {
	float frequency ;
	int frequencies ;
	int frequencyIndex ;
	int feedpointNumber ;
} FeedpointCache ;

//	v0.81d
typedef struct {
	Boolean radials ;
	Boolean distributedLoads ;
} GeometryOptions ;

#define	kRXPlotType				0
#define	kImpedancePlotType		1
#define	kSWRPlotType			2
#define	kReturnLossPlotType		3


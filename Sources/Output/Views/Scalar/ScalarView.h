//
//  ScalarView.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/7/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "DataView.h"
#import "AuxScalarView.h"

@interface ScalarView : DataView {
	IBOutlet AuxScalarView *auxScalarView ;
	IBOutlet NSPopUpButton *plotTypeMenu ;
	IBOutlet NSPopUpButton *plotScaleMenu ;
	NSColor *plotColor, *alternatePlotColor, *plotColorWithBackground, *plotColorNoBackground, *alternatePlotColorWithBackground, *alternatePlotColorNoBackground ;
	NSColor *backgroundColor, *textColor ;
	NSMutableDictionary *fontAttributes, *fontAttributesWithBackground, *fontAttributesNoBackground ;
	
	int samples ;
	float frequencyOffset ;
	ScalarView *printView ;					// the companion printing ScalarView
	
	//  drawing scheme
	float gridRed, gridGreen, gridBlue, lineWidth ;
	Boolean hasBackground ;
	
	PlotInfo plotInfo ;
	int selectedType, selectedScale, scalarType ;
	int scalarGainMenu[4] ;					//  one per plotTypeMenu index
	float scalarScrollerLocation[4] ;		//  one per plotTypeMenu index
}

- (int)plotType ;
- (AuxScalarView*)auxView ;
- (void)setRXScaleMenu ;
- (float)scrollOffset ;
- (void)setScrollOffset:(float)v ;
- (void)updatePlotType ;
- (void)setPrintView:(ScalarView*)pView ;



@end

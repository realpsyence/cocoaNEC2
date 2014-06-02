//
//  AuxScalarView.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/7/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "OutputTypes.h"
#import "AuxView.h"

@interface AuxScalarView : AuxView {
	NSColor *backgroundColor, *textColor ;
	NSMutableDictionary *fontAttributes, *fontAttributesWithBackground, *fontAttributesNoBackground ;
	PlotInfo *plotInfo ;
	RXF *rxf ;
	float z0 ;
	int plotType ;
	Boolean hasBackground ;
	NSColor *mainColor, *altColor ;
}

- (void)label:(PlotInfo*)plotInfo ;
- (void)setCaptionWithRXF:(RXF*)rp z0:(float)z plotType:(int)plotType mainColor:(NSColor*)mainc altColor:(NSColor*)altc ;

@end

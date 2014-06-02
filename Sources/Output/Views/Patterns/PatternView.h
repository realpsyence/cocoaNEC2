//
//  PatternView.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/22/07.


#import <Cocoa/Cocoa.h>
#import "AuxPatternView.h"
#import "PrintableView.h"
#import "Polarization.h"
#import "OutputTypes.h"

@class RadiationPattern ;

@interface PatternView : PrintableView {
	IBOutlet AuxPatternView *auxPatternView ;
	NSRect frame ;
	double rho ;
	int gainPolarization ;
	int *circle, minorMin, majorMin ;
	NSBezierPath *circles, *minorCircles ;
	NSMutableDictionary *captionAttributes, *smallInfoAttributes ;
	Boolean isElevation ;
	Boolean isEmbedded ;
	NSMutableArray *arrayOfRadiationPatterns, *arrayOfReferencePatterns, *arrayOfPreviousPatterns ;
	NSColor *refColor, *defaultColor, *plotColor[MAXCOLORWELLS] ;
}

- (id)initWithFrame:(NSRect)inFrame isElevation:(Boolean)isElevation ;
- (void)updateColorsFromColorWells:(ColorWells*)wells ;
- (void)changeColor:(NSColorWell*)well ;
- (void)setIsEmbedded:(Boolean)state ;

- (void)clearPatterns ;
- (void)updatePatternWithArray:(NSArray*)array refArray:(NSArray*)ref prevArray:(NSArray*)prev ;

- (void)drawPattern:(NSAffineTransform*)scale ;
- (void)plotGain:(NSBezierPath*)path gain:(float*)gain maxGain:(float)maxGain elementArray:(NSArray*)array count:(int)count ;

- (NSArray*)makeCaptions:(int)count reference:(RadiationPattern*)ref previous:(RadiationPattern*)ref ;

- (void)setGainScale:(double)s ;
- (void)setGainPolarization:(int)pol ;

- (AuxPatternView*)auxView ;
- (Boolean)isElevation ;

@end

//
//  SWRView.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/22/07.

#import "AuxSWRView.h"
#import "DataView.h"


@interface SWRView : DataView {
	IBOutlet AuxSWRView *auxSWRView ;
	IBOutlet NSButton *showAllCheckbox ;
	IBOutlet NSButton *smartInterpolationCheckbox ;
	IBOutlet NSWindow *colorWindow ;
	
	//  note: cannot make NSColorWell into NSMatrix
	IBOutlet NSColorWell *colorWell0 ;
	IBOutlet NSColorWell *colorWell1 ;
	IBOutlet NSColorWell *colorWell2 ;
	IBOutlet NSColorWell *colorWell3 ;
	IBOutlet NSColorWell *colorWell4 ;
	IBOutlet NSColorWell *colorWell5 ;
	IBOutlet NSColorWell *colorWell6 ;
	IBOutlet NSColorWell *colorWell7 ;
	IBOutlet NSColorWell *colorWell8 ;
	IBOutlet NSColorWell *colorWell9 ;
	IBOutlet NSColorWell *colorWell10 ;
	IBOutlet NSColorWell *colorWell11 ;
	IBOutlet NSColorWell *colorWell12 ;
	IBOutlet NSColorWell *colorWell13 ;
	IBOutlet NSColorWell *colorWell14 ;
	IBOutlet NSColorWell *colorWell15 ;
	
	NSColorWell *colorWell[16] ;
	NSColor *refColor, *refCenterColor ;
	float swrCircle ;
	float geometricScale ;
	float adjustedScale ;
	NSPoint center ;
	
	//  v0.70 to handle printing thin lines using alpha
	float currentLinewidth ;
	float currentRed, currentGreen, currentBlue ;
}

- (void)setSWRCircle:(float)circle ;
- (void)openColorManager ;

- (AuxSWRView*)auxView ;
- (Boolean)showAllFeedpoints ;

//	v0.73 smart interpolation support
- (Boolean)doSmartInterpolate ;
- (void)setSmartInterpolate:(Boolean)state ;

//  v0.70 get and set NSColor of well
- (NSColor*)wellColor:(int)index ;
- (void)setWellColor:(int)index color:(NSColor*)color ;
//	v0.70 let printing SWRView get its color wells from the GUI SWRView
- (NSColorWell*)colorWell:(int)i ;
- (void)setColorWell:(int)index fromColorWell:(NSColorWell*)well ;


@end

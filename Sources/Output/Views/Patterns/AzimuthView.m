//
//  AzimuthView.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/22/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "AzimuthView.h"
#import "RadiationPattern.h"
#import "PatternElement.h"


@implementation AzimuthView

- (id)initWithFrame:(NSRect)inFrame
{
    self = [ super initWithFrame:inFrame isElevation:NO ] ;
	return self ;
}

//  AzimuthView - use phi as angle
- (void)plotGain:(NSBezierPath*)path gain:(float*)gain maxGain:(float)maxGain elementArray:(NSArray*)array count:(int)count 
{
	int i ;
	float angle, r ;
	PatternInfo info ;
	NSPoint point ;
	
	for ( i = 0; i < count; i++ ) {
		info = [ [ array objectAtIndex:i ] info ] ;		//  PatternInfo for PatternElement in array
		angle = info.phi*( 3.1415926/180.0 ) ;
		r = pow( rho, gain[i]-maxGain ) ;				
		point = NSMakePoint( r*cos( angle ), r*sin( angle ) ) ;		
		if ( i == 0 ) [ path moveToPoint:point ] ; else [ path lineToPoint:point ] ;
	}
}

//	v0.70 Returns an array of elements
//	Each element is an array of 1) NSString and 2) color index
//	The color index is -1 for reference
- (NSArray*)makeCaptions:(int)count reference:(RadiationPattern*)ref previous:(RadiationPattern*)prev
{
	RadiationPattern *radiationPattern ;
	NSMutableArray *array ;
	NSString *label ;
	int i ;
	float elev ;
	
	array = [ NSMutableArray array ] ;
	
	if ( prev != nil ) {
		[ array addObject:[ NSArray arrayWithObjects:@"Previous", [ NSNumber numberWithInt:-1 ], nil ] ] ;
	}
	else {	
		if ( ref != nil ) [ array addObject:[ NSArray arrayWithObjects:@"Reference", [ NSNumber numberWithInt:-1 ], nil ] ] ;
	}
	for ( i = 0; i < count; i++ ) {
		radiationPattern = [ arrayOfRadiationPatterns objectAtIndex:i ] ;
		
		elev = 90 - fabs( [ radiationPattern meanTheta ] ) ;
		label = [ NSString stringWithFormat:@"%.3f MHz %4.1f deg.", [ radiationPattern frequency ], elev ] ;
		[ array addObject:[ NSArray arrayWithObjects:label, [ NSNumber numberWithInt:i ], nil ] ] ;
	}
	return array ;
}

@end

//
//  ElevationView.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/22/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "ElevationView.h"
#import "PatternElement.h"
#import "RadiationPattern.h"

@implementation ElevationView

- (id)initWithFrame:(NSRect)inFrame
{
    self = [ super initWithFrame:inFrame isElevation:YES ] ;
	return self ;
}

//  ElevationView - use 90-theta as angle
- (void)plotGain:(NSBezierPath*)path gain:(float*)gain maxGain:(float)maxGain elementArray:(NSArray*)array count:(int)count
{
	int i ;
	float angle, r ;
	PatternInfo info ;
	NSPoint point ;
	
	for ( i = 0; i < count; i++ ) {
		info = [ [ array objectAtIndex:i ] info ] ;		//  PatternInfo for PatternElement
		angle = ( 90-info.theta )*( 3.1415926/180.0 ) ;
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
	float azi ;
	
	array = [ NSMutableArray array ] ;
	
	if ( prev != nil ) {
		[ array addObject:[ NSArray arrayWithObjects:@"Previous", [ NSNumber numberWithInt:-1 ], nil ] ] ;
	}
	else {	
		if ( ref != nil ) [ array addObject:[ NSArray arrayWithObjects:@"Reference", [ NSNumber numberWithInt:-1 ], nil ] ] ;
	}

	for ( i = 0; i < count; i++ ) {
		radiationPattern = [ arrayOfRadiationPatterns objectAtIndex:i ] ;
		azi = [ radiationPattern meanPhi ] ;		
		label = [ NSString stringWithFormat:@"%.3f MHz %4.1f deg.", [ radiationPattern frequency ], azi ] ;
		[ array addObject:[ NSArray arrayWithObjects:label, [ NSNumber numberWithInt:i ], nil ] ] ;
	}
	return array ;
}

@end

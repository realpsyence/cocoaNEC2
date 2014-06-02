//
//  NCRadials.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/23/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "NCRadials.h"
#import "formats.h"

@implementation NCRadials


- (id)initWithElements:(int)elements x:(double)ix y:(double)iy z:(double)iz length:(double)ilength radius:(double)iradius
{
	self = [ super init ] ;
	if ( self ) {
		numberOfElements = elements ;
		x = ix ;
		y = iy ;
		z = iz ;
		length = ilength ;
		radius = iradius ;
	}
	return self ;
}

+ (id)radialsWithElements:(int)elements x:(double)ix y:(double)iy z:(double)iz length:(double)ilength radius:(double)iradius
{
	NCRadials *radials ;
	
	radials = [ [ NCRadials alloc ] initWithElements:elements x:ix y:iy z:iz length:ilength radius:iradius ] ;
	return [ radials autorelease ] ;
}

- (NSArray*)geometryCards:(int)tag
{
	NSMutableArray *array ;
	NSString *card ;
	double theta, dtheta, dx0, dy0, dx, dy, minSegment, minLimit, maxLimit, l0, l1, remainder, s, c ;
	int i, j, segments ;
	
	if ( numberOfElements <= 0 ) return [ NSArray array ] ;
	
	minLimit = fabs( radius )*6 ;	//  don't allow segment to be less than 6 times the wire radius
	maxLimit = 1 ;					//  0.1 wavelength at 10m
	
	minSegment = fabs( z ) ;
	if ( minSegment > 0.5 ) minSegment = 0.5 ;				// 5% of wavelenth at 10m
	if ( minSegment < minLimit ) minSegment = minLimit ;
	
	/* if ( !tapered ) */ minSegment = 1000.0 ;
	
	array = [ [ NSMutableArray alloc ] initWithCapacity:numberOfElements ] ;
	theta = 0.0 ;
	dtheta = 2*3.1415926535/numberOfElements ;
	for ( i = 0; i < numberOfElements; i++ ) {
		c = cos( theta ) ;
		s = sin( theta ) ;
		minLimit = minSegment ;
		// taper into a maximum of 16 wires
		l0 = l1 = dx0 = dy0 = 0 ;
		for ( j = 0; j < 16; j++ ) {
			if ( minLimit >= maxLimit ) break ;
			l1 = l0 + minLimit ;
			if ( l1 >= length ) break ;
			dx = l1*c ;
			dy = l1*s ;
			//  v0.64
			card = [ NSString stringWithFormat:@"GW%3d%5d%10s%10s%10s%10s%10s%10s%10s", ++tag, 1, dtos(x+dx0), dtos(y+dy0), dtos(z), dtos(x+dx), dtos(y+dy), dtos(z), dtos(radius) ] ;
			[ array addObject:card ] ;
			l0 = l1 ;
			dx0 = dx ;
			dy0 = dy ;
			minLimit *= 2.0 ;	//  double the segments
		}
		remainder = length - l1 ;
		if ( remainder > 0 ) {
			segments = ( remainder/maxLimit ) + 1 ;
			if ( segments > 21 ) segments = 21 ;
			dx = length*c ;
			dy = length*s ;
			//  v0.64
			card = [ NSString stringWithFormat:@"GW%3d%5d%10s%10s%10s%10s%10s%10s%10s", ++tag, segments, dtos(x+dx0), dtos(y+dy0), dtos(z), dtos(x+dx), dtos(y+dy), dtos(z), dtos(radius) ] ;
			[ array addObject:card ] ;
		}
		theta += dtheta ;
	}
	return [ array autorelease ] ;
}


@end

//
//  CurrentSource.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/10/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "CurrentSource.h"
#import "ApplicationDelegate.h"

@implementation CurrentSource

//  Note: this class has been deprecated

- (id)initAsAttachmentTo:(WireGeometry*)wire
{
	self = [ super initWithDelegate:[ wire delegate ] ] ;
	if ( self ) {
		selectedType = CURRENTSOURCE ;
		attachedToWire = wire ;
	}
	return self ;
}

- (void)setLocation:(Expression*)e
{
	WireInfo *wire ;
	int i, segments ;
	double radius, component[3], center[3], r, p, scale ;
	
	wire = [ attachedToWire info ] ;
	//  sanity check
	if ( wire->excitationKind != 2 ) {
		[ [ NSApp delegate ] insertError:@"Inconsistency with current source!" ] ;
		return ;
	}
	
	targetTag = wire->tag ;
	targetSegment = wire->excitationLocation ;
	
	current[0] = wire->excitationVector[0] ;
	current[1] = wire->excitationVector[1] ;
	
	segments = wire->segments ;
	radius = wire->radius ;
	r = ( wire->excitationLocation - 0.5 )/segments;
	
	p = 0.0 ;
	for ( i = 0; i < 3; i++ ) {
		component[i] = ( wire->to[i] - wire->from[i] ) ;
		p += component[i]*component[i] ;
		center[i] = component[i]*r + wire->from[i] ;
	}
	//  scale component to 10x wire radius
	scale = 1.0/( sqrt( p ) + .0001 ) ;
	radius *= 10.0 ;
	for ( i = 0; i < 3; i++ ) {
		unitVector[i] = component[i]*scale ;
		component[i] = unitVector[i]*radius ;
	}
	for ( i = 0; i < 3; i++ ) {
		from[i] = center[i] - component[i] ;
		to[i] = center[i] + component[i] ;
	}
}

//  generate a 3 segment card for a wire with displacement
- (NSArray*)geometryCards:(Expression*)e tag:(int)tag displacement:(double)d
{

	printf( "CurrentSource: geometryCards:tag:displacement called\n" ) ;
	
	startingTag = endingTag = tag ;
	[ self setLocation:e ] ;
	if ( card1 ) [ card1 release ] ;
	//  v0.64
	card1 = [ [ NSString alloc ] initWithFormat:@"GW%3d%5d %9f %9f %9f %9f %9f %9f %9f", tag, 3, from[0]+d, from[1]+d, from[2]+d, to[0]+d, to[1]+d, to[2]+d, 0.0008 ] ;
	return [ NSArray arrayWithObjects: card1, nil ] ;
}

//  generate wire and network card
- (NSArray*)generateExcitationAndNetwork
{
	if ( card1 ) [ card1 release ] ;
	card1 = [ [ NSString alloc ] initWithFormat:@"NT%3d%5d%5d%5d %9f %9f %9f %9f %9f %9f", startingTag, 2, targetTag, targetSegment, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0 ] ;
	if ( card2 ) [ card2 release ] ;
	//  NOTE: apply 90 degree phase shift to compensate for y12
	card2 = [ [ NSString alloc ] initWithFormat:@"EX%3d%5d%5d%5d %9f %9f%10s%10s%10s%10s", 0, startingTag, 2, 1, -current[1], current[0], "", "", "", "" ]  ;
	return [ NSArray arrayWithObjects: card1, card2, nil ] ;
}

- (int)targetTag
{
	return targetTag ;
}

- (int)targetSegment
{
	return targetSegment ;
}

@end

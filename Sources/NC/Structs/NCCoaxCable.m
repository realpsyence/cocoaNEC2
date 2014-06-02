//
//  NCCoaxCable.m
//  cocoaNEC
//
//  Created by Kok Chen on 4/23/12.
//  Copyright 2012 Kok Chen, W7AY. All rights reserved.
//

#import "NCCoaxCable.h"
#import "ApplicationDelegate.h"
#import "NCLoad.h"
#import "NCSystem.h"
#import "NECEngines.h"

//	v0.78
//	Models practical transmission lines (NT card with wire representing shield.

@implementation NCCoaxCable

#define	metersPerFeet	0.0328084

//	coaxParam contains crossed, y1r, y1i, y2r and y2i.
//	this routine adds Ro, velocityFactor, k1, k2
- (id)initFrom:(NCWire*)element1 to:(NCWire*)element2 coax:(NCCoax*)inCoax params:(CoaxCableParams*)params stack:(RuntimeStack*)inStack
{
	WireCoord point1, point2 ;
	NCWire *shield ;
	NCGeometry *shieldGeometry ;
	NCNetwork *network ;
	int n, segment1, segment2, end1, end2, shield1, shield2, cross1, cross2 ;
	double gap, radius, shieldRadius, jacketRadius ;

	self = [ super init ] ;
	if ( self ) {
		coax = inCoax ;
		stack = inStack ;
		params->length = [ [ NCWire vector:element1 to:element2 ] length ] ;
		
		//	least significant digit of params->endN: 0 (center), 1 (end1 of wire) or 2 (end2 of wire)
		//	10s digit: do not connect shield (if both ends of coax are disconnected, don't generate shield)
		//	100s digit, reverse connection (crossed)
		end1 = CoaxLocationDigit( params->end1 ) ;
		shield1 = CoaxShieldDigit( params->end1 ) ;
		cross1 = CoaxCrossedDigit( params->end1 ) ;
		end2 = CoaxLocationDigit( params->end2 ) ;
		shield2 = CoaxShieldDigit( params->end2 ) ;
		cross2 = CoaxCrossedDigit( params->end2 ) ;
		
		segment1 = segment2 = 0 ;
		if (  shield1 == 0 || shield2 == 0 ) {
			//  has shield (at least one end of shield is connected)
			radius = [ coax shieldRadius ] ;
			gap = radius*2 ;
			
			switch ( end1 ) {
			default:
			case 0:
				segment1 = ( [ element1 segments ]+1 )/2 ;
				n = ( cross1 == 0 ) ? 0 : 1 ;
				point1 = [ element1 coordAtSegment:( segment1 - n ) ] ;
				break ;
			case 1:
				segment1 = 1 ;
				point1 = [ element1 coordAtSegment:0 ] ;
				break ;
			case 2:
				segment1 = [ element1 segments ] ;
				point1 = [ element1 coordAtSegment:segment1 ] ;
				break ;
			}
			switch ( end2 ) {
			default:
			case 0:
				segment2 = ( [ element2 segments ]+1 )/2 ;
				n = ( cross2 == 0 ) ? 0 : 1 ;
				point2 = [ element2 coordAtSegment:( segment2 - n ) ] ;
				break ;
			case 1:
				segment2 = 1 ;
				point2 = [ element2 coordAtSegment:0 ] ;
				break ;
			case 2:
				segment2 = [ element2 segments ] ;
				point2 = [ element2 coordAtSegment:segment2 ] ;
				break ;
			}
			shieldGeometry = [ NCGeometry geometryWithEnd1:&point1 end2:&point2 ] ;
			//	"physical" coax shield
			[ shieldGeometry shortenEndsBy:gap ] ;
			
			//  generate shield (with two short tapered segments for connection) ;
			if ( shield1 == 0 ) [ stack->system newWire:&point1 end2:[ shieldGeometry end1 ] radius:sqrt( radius*[ element1 radius ] ) segments:7 ] ;
			shieldRadius = [ coax shieldRadius ] ;
			shield = [ stack->system newWire:shieldGeometry radius:shieldRadius segments:33 ] ;
			jacketRadius = [ coax jacketRadius ] ;
			if ( jacketRadius > shieldRadius ) [ stack->system yurkovInsulate:shield insulationRadius:jacketRadius permittivity:[ coax jacketPermittivity ] velocityFactor:0.92 ] ;
			if ( shield2 == 0 ) [ stack->system newWire:[ shieldGeometry end2 ] end2:&point2 radius:sqrt( radius*[ element2 radius ] ) segments:7 ] ;
		}
		//  Create NCNetwork for the transmission line properties.
		//	The NCNetwork is of type NCCOAX, whose admittance matrix is evaluated only when the frequency is known.
		network = [ NCNetwork networkFrom:element1 segment:segment1 to:element2 segment:segment2 coax:coax params:params ] ;
		[ element1 addNetwork:network ] ;

		return self ;
	}
	return nil ;
}

@end

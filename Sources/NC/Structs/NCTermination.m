//
//  NCTermination.m
//  cocoaNEC
//
//  Created by Kok Chen on 5/30/12.
//  Copyright 2012 Kok Chen, W7AY. All rights reserved.
//

#import "NCTermination.h"
#import "NCWire.h"
#import "NCSystem.h"

@implementation NCTermination

- (id)initAsType:(int)inType real:(double)inReal imag:(double)inImag c:(double)inC terminationWire:(NCWire*)wire
{
	self = [ super initAsType:inType real:inReal imag:inImag c:inC ] ;
	if ( self ) {
		terminationWire = wire ;
	}
	return self ;
}

- (NCWire*)terminationWire
{
	return terminationWire ;
}

- (int)tagOfTerminationWire
{
	if ( terminationWire == nil ) return 0 ;
	return [ terminationWire tag ] ;
}

+ (id)impedanceTermination:(NCWire*)wire real:(double)inReal imag:(double)inImag system:(NCSystem*)system
{
	NCLoad *load ;
	WireCoord e1, e2 ;
	
	//	create a short wire segment in the far field (large z)
	e1 = e2 = [ wire midpoint ] ;
	e1.z = e2.z = ( e1.z + [ system farFieldDisplacement ] ) ;
	e1.x += 0.005 ;
	//  generate 3 segment wire
	wire = [ system newWire:&e1 end2:&e2 radius:0.001 segments:3 ] ;
	load = [ [ NCTermination alloc ] initAsType:IMPEDANCETERMINATION real:inReal imag:inImag c:0.0 terminationWire:wire ] ;
	return [ load autorelease ] ;
}


@end

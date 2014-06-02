//
//  PatternElement.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/22/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "PatternElement.h"
#import "math.h"

@implementation PatternElement

//	v0.61 -- perform "lazy init"

- (id)initWithLine:(char*)string
{
	self = [ super init ] ;
	if ( self ) {
		cached = NO ;
		if ( strlen( string ) < 16 ) {
			[ self autorelease ] ;
			return nil ;
		}
		strcpy( line, string ) ;
	}
	return self ;
}

- (PatternInfo)info
{
	if ( !cached ) [ self cachePattern ] ;
	return w ;
}

- (Boolean)cachePattern
{
	float axialRatio, tilt ;
	double p, q, denom, factor, dB0, dB1  ;
	char sense ;
	
	if ( cached ) return YES ;	//  already cached v0.61
	
	w.theta = 400.0 ;
	sscanf( line, "%f %f %f %f %f %f %f %c", &w.theta, &w.phi, &w.dBv, &w.dBh, &w.dBt, &axialRatio, &tilt, &sense ) ;
	if ( w.theta > 361 ) return NO ;
	
	//	v0.67 compute RHCP and LHCP responses (see notes in Polarization.h).	
	//	sense character is "L" for left or linear and "R" for right
	q = 1 + axialRatio*axialRatio ;
	p = 2*axialRatio ;
	denom = 2.0*q ;
	//  same polarization direction
	factor = ( q+p )/denom ;
	if ( factor < 1.0e-10 ) factor = factor = 1.0e-10 ; else if ( factor > 1.0 ) factor = 1.0 ;
	dB0 = 10*log10( factor ) ;
	//  opposite polarization direction
	factor = ( q-p )/denom ;
	if ( factor < 1.0e-10 ) factor = factor = 1.0e-10 ; else if ( factor > 1.0 ) factor = 1.0 ;
	dB1 = 10*log10( factor ) ;
	
	if ( sense == 'R' ) {
		w.dBr = w.dBt + dB0 ;
		w.dBl = w.dBt + dB1 ;
	}
	else {
		w.dBr = w.dBt + dB1 ;
		w.dBl = w.dBt + dB0 ;
	}	
	cached = YES ;
	
	return YES ;
}

@end

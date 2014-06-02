/*
 *  formats.c
 *  cocoaNEC
 *
 *  Created by Kok Chen on 9/24/07.
 *  Copyright 2007 Kok Chen, W7AY. All rights reserved.
 *
 */

#include "formats.h"


//  create floating point numbers that fit in a 10 character field
const char* dtos( double value ) 
{
	double p ;
	NSString *fmt ;
	
	p = fabs( value ) ;
	
	if ( p < 1.0e-9 ) {
		p = 0 ;
		value = 0 ;
	}
	
	if ( value >= 0 ) {
		if ( p == 0 ) fmt = @"%10.6f" ;
		else if ( p < .001 ) fmt = @"%10.2E" ;
		else if ( p < 10.0 ) fmt = @"%10.6f" ;
		else if ( p < 100.0 ) fmt = @"%10.5f" ;
		else if ( p < 1000.0 ) fmt = @"%10.4f" ;
		else if ( p < 10000.0 ) fmt = @"%10.3f" ;
		else fmt = @"%10.3E" ;
	}
	else {
		if ( p == 0 ) fmt = @"%10.5f" ;
		else if ( p < .001 ) fmt = @"%10.2E" ;
		else if ( p < 10.0 ) fmt = @"%10.5f" ;
		else if ( p < 100.0 ) fmt = @"%10.4f" ;
		else if ( p < 1000.0 ) fmt = @"%10.3f" ;
		else fmt = @"%10.2E" ;
	}

	return [ [ NSString stringWithFormat:fmt, value ] UTF8String ] ;
}

const char* dtosExtended( double value ) 
{
	double p ;
	NSString *fmt ;
	
	p = fabs( value ) ;
	
	if ( value >= 0 ) {
		if ( p == 0 ) fmt = @"%10.6f" ;
		else if ( p < .001 ) fmt = @"%10.3E" ;
		else if ( p < 10.0 ) fmt = @"%10.6f" ;
		else if ( p < 100.0 ) fmt = @"%10.5f" ;
		else if ( p < 1000.0 ) fmt = @"%10.4f" ;
		else if ( p < 10000.0 ) fmt = @"%10.3f" ;
		else fmt = @"%10.3E" ;
	}
	else {
		if ( p == 0 ) fmt = @"%10.5f" ;
		else if ( p < .001 ) fmt = @"%10.2E" ;
		else if ( p < 10.0 ) fmt = @"%10.5f" ;
		else if ( p < 100.0 ) fmt = @"%10.4f" ;
		else if ( p < 1000.0 ) fmt = @"%10.3f" ;
		else if ( p < 10000.0 ) fmt = @"%10.2f" ;
		else fmt = @"%10.2E" ;
	}
	
	return [ [ NSString stringWithFormat:fmt, value ] UTF8String ] ;
}

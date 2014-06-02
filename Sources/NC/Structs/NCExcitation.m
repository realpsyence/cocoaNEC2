//
//  NCExcitation.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/22/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "NCExcitation.h"


@implementation NCExcitation

- (id)initWithType:(int)inType real:(double)r imag:(double)i
{
	self = [ super init ] ;
	if ( self ) {
		type = inType ;
		real = r ;
		imag = i ;
	}
	return self ;
}

//  v0.51 -- incdent plane waves
- (id)initWithType:(int)inType theta:(double)t phi:(double)p eta:(double)e
{
	self = [ super init ] ;
	if ( self ) {
		type = inType ;
		theta = t ;
		phi = p ;
		eta = e ;
	}
	return self ;
}

- (int)excitationType
{
	return type ;
}

- (double)real
{
	return real ;
}

- (double)imag
{
	return imag ;
}

- (double)theta
{
	return theta ;
}

- (double)phi
{
	return phi ;
}

- (double)eta
{
	return eta ;
}

@end

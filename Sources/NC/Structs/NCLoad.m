//
//  NCLoad.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/23/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "NCLoad.h"
#import "NCSystem.h"
#import "NCWire.h"

@implementation NCLoad

- (id)initAsType:(int)inType real:(double)inReal imag:(double)inImag c:(double)inC
{
	self = [ super init ] ;
	if ( self ) {
		type = inType ;
		real = inReal ;
		imag = inImag ;
		c = inC ;
		segment0 = segment1 = 0 ;
		perLength = NO ;
	}
	return self ;
}

- (id)initAsSegmentType:(int)inType real:(double)inReal imag:(double)inImag c:(double)inC perLength:(Boolean)distr s0:(int)s0 s1:(int)s1
{
	self = [ super init ] ;
	if ( self ) {
		type = inType ;
		real = inReal ;
		imag = inImag ;
		c = inC ;
		segment0 = s0 ;
		segment1 = s1 ;
		perLength = distr ;
	}
	return self ;
}

+ (id)impedanceLoad:(double)inReal imag:(double)inImag 
{
	NCLoad *load ;
	
	load = [ [ NCLoad alloc ] initAsType:IMPEDANCELOAD real:inReal imag:inImag c:0.0 ] ;
	[ load autorelease ] ;
	return load ;
}

+ (id)conductivity:(double)inReal 
{
	NCLoad *load ;
	
	load = [ [ NCLoad alloc ] initAsType:CONDUCTIVELOADALLSEGMENTS real:inReal imag:0.0 c:0.0 ] ;
	[ load autorelease ] ;
	return load ;
}

+ (id)rlc:(int)rlcType r:(double)r l:(double)l c:(double)inC
{
	NCLoad *load ;
	
	load = [ [ NCLoad alloc ] initAsType:rlcType real:r imag:l c:inC ] ;
	[ load autorelease ] ;
	return load ;
}

+ (id)rlcAtSegments:(int)rlcType r:(double)r l:(double)l c:(double)inC perLength:(int)distr s0:(int)s0 s1:(int)s1
{
	NCLoad *load ;
	
	load = [ [ NCLoad alloc ] initAsSegmentType:rlcType real:r imag:l c:inC perLength:( distr != 0 ) s0:s0 s1:s1 ] ;
	[ load autorelease ] ;
	return load ;
}

+ (id)conductivityAtSegments:(double)inReal s0:(int)s0 s1:(int)s1
{
	NCLoad *load ;
	
	load = [ [ NCLoad alloc ] initAsSegmentType:CONDUCTIVELOAD real:inReal imag:0.0 c:0.0 perLength:1 s0:s0 s1:s1 ] ;
	[ load autorelease ] ;
	return load ;
}

+ (id)impedanceAtSegments:(double)inReal imag:(double)inImag s0:(int)s0 s1:(int)s1
{
	NCLoad *load ;
	
	load = [ [ NCLoad alloc ] initAsSegmentType:IMPEDANCELOAD real:inReal imag:inImag c:0.0 perLength:1 s0:s0 s1:s1 ] ;
	[ load autorelease ] ;
	return load ;
}

//  v0.73
+ (id)insulateWithPermittivity:(double)permittivity conductivity:(double)conductivity radius:(double)radius
{
	NCLoad *load ;
	
	load = [ [ NCLoad alloc ] initAsType:INSULATEDWIRE real:permittivity imag:conductivity c:radius ] ;
	[ load autorelease ] ;
	return load ;
}

- (int)loadType
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

- (double)conductivity
{
	return real ;
}

- (double)r
{
	return real ;
}

- (double)l
{
	return imag ;
}

- (double)c
{
	return c ;
}

- (int)segment0 
{
	return segment0 ;
}

- (int)segment1
{
	return segment1 ;
}


@end

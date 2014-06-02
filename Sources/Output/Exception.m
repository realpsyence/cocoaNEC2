//
//  Exception.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/23/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "Exception.h"
#import "WireTypes.h"


@implementation Exception

//  Exceptions have a NEC-2 tag and a wireType
//	This allows the geometry view to process them as special cases:
//		- ignore radials if the output options says so
//		- handle current segments differently

- (id)initWithRadial:(int)wireTag
{
	self = [ super init ] ;
	if ( self ) {
		wireType = RADIALEXCEPTION ;
		tag = wireTag ;
	}
	return self ;
}

- (id)initWithCurrentSource:(int)wireTag targetTag:(int)targetTag targetSegment:(int)targetSegment
{
	self = [ super init ] ;
	if ( self ) {
		wireType = CURRENTEXCEPTION ;
		tag = wireTag ;
		tagOfTarget = targetTag ;
		segmentOfTarget = targetSegment ;
	}
	return self ;
}

//	v0.81
//	THis flags the Geometry view to not draw wire
- (id)initWithTermination:(int)wireTag targetTag:(int)targetTag targetSegment:(int)targetSegment
{
	self = [ super init ] ;
	if ( self ) {
		wireType = TERMINATIONEXCEPTION ;
		tag = wireTag ;
		tagOfTarget = targetTag ;
		segmentOfTarget = targetSegment ;
	}
	return self ;
}

+ (id)exceptionForRadial:(int)wireTag
{
	Exception *exception ;
	
	exception = [ [ Exception alloc ] initWithRadial:wireTag ] ;
	return [ exception autorelease ] ;
}

+ (id)exceptionForCurrentSource:(int)wireTag targetTag:(int)targetTag targetSegment:(int)targetSegment
{
	Exception *exception ;
	
	exception = [ [ Exception alloc ] initWithCurrentSource:wireTag targetTag:targetTag targetSegment:targetSegment ] ;
	return [ exception autorelease ] ;
}

+ (id)exceptionForTermination:(int)wireTag targetTag:(int)targetTag targetSegment:(int)targetSegment
{
	Exception *exception ;
	
	exception = [ [ Exception alloc ] initWithTermination:wireTag targetTag:targetTag targetSegment:targetSegment ] ;
	return [ exception autorelease ] ;
}

- (int)wireType 
{
	return wireType ;
}

- (intType)tag
{
	return tag ;
}

- (int)tagOfTarget
{
	return tagOfTarget ;
}

- (int)segmentOfTarget
{
	return segmentOfTarget ;
}

@end

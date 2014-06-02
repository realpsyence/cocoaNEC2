//
//  Transform.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/3/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "Transform.h"


@implementation Transform

static void initCoord( Coordinate *c, Coordinate *origin )
{
	c->u0 = c->u = c->x - origin->x ;
	c->v0 = c->v = c->y - origin->y ;
	c->w0 = c->w = c->z - origin->z ;
}

static void scaleCoord( Coordinate *c, float scale )
{
	c->u0 = ( c->u *= scale ) ;
	c->v0 = ( c->v *= scale ) ;
	c->w0 = ( c->w *= scale ) ;
}

static void rotateXCoord( Coordinate *c, float cs, float sn ) 
{
	float y = c->v ;
	float z = c->w ;
	
	c->v = cs*y - sn*z ;
	c->w = sn*y + cs*z ;
}

static void rotateYCoord( Coordinate *c, float cs, float sn ) 
{
	float x = c->u ;
	float z = c->w ;
	
	c->u = cs*z - sn*x ;
	c->w = sn*z + cs*x ;
}

static void rotateZCoord( Coordinate *c, float cs, float sn ) 
{
	float x = c->u ;
	float y = c->v ;
	
	c->u = cs*x - sn*y ;
	c->v = sn*x + cs*y ;
}

static void resetCoord( Coordinate *c ) 
{
	c->u = c->u0 ;
	c->v = c->v0 ;
	c->w = c->w0 ;
}

//  move to origin and scale coordinates
+ (void)initializeGeometryElements:(NSArray*)arrayOfElements origin:(Coordinate*)origin
{
	int i, count ;
	OutputGeometryElement *element ;
	GeometryInfo *info = nil ;
	Coordinate *c ;
	float dmax, d ;
	
	count = [ arrayOfElements count ] ;
	dmax = 1.0e-6 ;
	for ( i = 0; i < count; i++ ) {
		element = [ arrayOfElements objectAtIndex:i ] ;
		info = [ element info ] ;
		c = &info->coord ;
		initCoord( c, origin) ;
		initCoord( &info->end[0], origin ) ;
		initCoord( &info->end[1], origin ) ;
		
		d = ( c->u*c->u + c->v*c->v + c->w*c->w ) ;
		if ( d > dmax ) dmax = d ;
	}
	d = 0.7/sqrt( dmax ) ;
	
	for ( i = 0; i < count; i++ ) {
		element = [ arrayOfElements objectAtIndex:i ] ;
		info = [ element info ] ;
		scaleCoord( &info->coord, d ) ;
		scaleCoord( &info->end[0], d ) ;
		scaleCoord( &info->end[1], d ) ;
	}
}

+ (void)rotateX:(NSArray*)arrayOfElements angle:(float)angle
{
	OutputGeometryElement *element ;
	GeometryInfo *info ;
	float c, s, theta = angle*3.1415926535/180.0 ;
	int i, count ;
	
	c = cos( theta ) ;
	s = sin( theta ) ;

	count = [ arrayOfElements count ] ;
	for ( i = 0; i < count; i++ ) {
		element = [ arrayOfElements objectAtIndex:i ] ;
		info = [ element info ] ;
		rotateXCoord( &info->coord, c, s ) ;
		rotateXCoord( &info->end[0], c, s ) ;
		rotateXCoord( &info->end[1], c, s ) ;
	}
}

+ (void)rotateY:(NSArray*)arrayOfElements angle:(float)angle
{
	OutputGeometryElement *element ;
	GeometryInfo *info ;
	float c, s, theta = angle*3.1415926535/180.0 ;
	int i, count ;
	
	c = cos( theta ) ;
	s = sin( theta ) ;

	count = [ arrayOfElements count ] ;
	for ( i = 0; i < count; i++ ) {
		element = [ arrayOfElements objectAtIndex:i ] ;
		info = [ element info ] ;
		rotateYCoord( &info->coord, c, s ) ;
		rotateYCoord( &info->end[0], c, s ) ;
		rotateYCoord( &info->end[1], c, s ) ;
	}
}

+ (void)rotateZ:(NSArray*)arrayOfElements angle:(float)angle
{
	OutputGeometryElement *element ;
	GeometryInfo *info ;
	float c, s, theta = angle*3.1415926535/180.0 ;
	int i, count ;
	
	c = cos( theta ) ;
	s = sin( theta ) ;
	
	count = [ arrayOfElements count ] ;
	for ( i = 0; i < count; i++ ) {
		element = [ arrayOfElements objectAtIndex:i ] ;
		info = [ element info ] ;
		rotateZCoord( &info->coord, c, s ) ;
		rotateZCoord( &info->end[0], c, s ) ;
		rotateZCoord( &info->end[1], c, s ) ;
	}
}

static void projectCoord( Coordinate *c, float x, float y, float z ) 
{
	float u = c->u ;
	float v = c->v ;
	float w = c->w ;
	float scale = 0.1 ;
	
	c->u = ( u - x )*scale ;
	c->v = ( v - y )*scale ;
	c->w = ( w - z )*scale ;
}

+ (void)projectElevation:(NSArray*)arrayOfElements angle:(float)angle
{
	OutputGeometryElement *element ;
	GeometryInfo *info ;
	float x, z, dist, theta = angle*3.1415926535/180.0 ;
	int i, count ;
	
	dist = 10.0 ;
	x = dist*cos( theta ) ;
	z = dist*sin( theta ) ;

	count = [ arrayOfElements count ] ;
	for ( i = 0; i < count; i++ ) {
		element = [ arrayOfElements objectAtIndex:i ] ;
		info = [ element info ] ;
		projectCoord( &info->coord, x, 0.0, z ) ;
		projectCoord( &info->end[0], x, 0.0, z ) ;
		projectCoord( &info->end[1], x, 0.0, z ) ;
	}
}

+ (void)reset:(NSArray*)arrayOfElements
{
	OutputGeometryElement *element ;
	GeometryInfo *info ;
	int i, count ;
	
	count = [ arrayOfElements count ] ;
	for ( i = 0; i < count; i++ ) {
		element = [ arrayOfElements objectAtIndex:i ] ;
		info = [ element info ] ;
		resetCoord( &info->coord ) ;
		resetCoord( &info->end[0] ) ;
		resetCoord( &info->end[1] ) ;
	}
}

//  v0.75c rotate unit vectors (origin, ^x, ^y and ^z)
+ (void)rotateUnitVectorsX:(GeometryInfo*)info angle:(float)angle
{
	float c, s, theta = angle*3.1415926535/180.0 ;
	int i ;
		
	c = cos( theta ) ;
	s = sin( theta ) ;
	for ( i = 0; i < 4; i++ ) rotateXCoord( &info[i].coord, c, s ) ;
}

//  v0.75c rotate unit vectors (origin, ^x, ^y and ^z)
+ (void)rotateUnitVectorsZ:(GeometryInfo*)info angle:(float)angle
{
	float c, s, theta = angle*3.1415926535/180.0 ;
	int i ;
		
	c = cos( theta ) ;
	s = sin( theta ) ;
	for ( i = 0; i < 4; i++ ) rotateZCoord( &info[i].coord, c, s ) ;
}

+ (void)initializeUnitVectors:(GeometryInfo*)info 
{
	int i ;
	
	for ( i = 0; i < 4; i++ ) {
		info[i].coord.x = info[i].coord.y = info[i].coord.z = 0 ;
		info[i].coord.u = info[i].coord.v = info[i].coord.w = 0 ;
	}
	info[1].coord.x = info[1].coord.u = 1.0 ;
	info[2].coord.y = info[2].coord.v = 1.0 ;
	info[3].coord.z = info[3].coord.w = 1.0 ;
}


@end

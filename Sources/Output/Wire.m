//
//  Wire.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/22/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "Wire.h"


@implementation Wire

- (Boolean)parseWire:(char*)string
{
	int number ;
	
	if ( strlen( string ) < 16 ) return NO ;
	
	number = w.segments = -1 ;
	w.radius = -1 ;
	sscanf( string, "%d %lf %lf %lf %lf %lf %lf %lf %d", &number, &w.x1, &w.y1, &w.z1, &w.x2, &w.y2, &w.z2, &w.radius, &w.segments ) ;
	if ( number < 0 || w.segments < 0 || w.radius < 0 ) return NO ;
	
	return YES ;
}

- (id)initWithLine:(char*)string
{
	self = [ super init ] ;
	if ( self ) {
		if ( ![ self parseWire:string ] ) {
			[ self autorelease ] ;
			return nil ;
		}
	}
	return self ;
}

- (WireInfo)info
{
	return w ;
}

@end

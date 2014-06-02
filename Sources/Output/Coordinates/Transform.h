//
//  Transform.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/3/07.

	#import <Cocoa/Cocoa.h>
	#import "coordinate.h"
	#import "OutputGeometryElement.h"

	@interface Transform : NSObject {

	}

	+ (void)initializeGeometryElements:(NSArray*)arrayOfElements origin:(Coordinate*)origin ;

	+ (void)rotateX:(NSArray*)arrayOfElements angle:(float)angle ;
	+ (void)rotateY:(NSArray*)arrayOfElements angle:(float)angle ;
	+ (void)rotateZ:(NSArray*)arrayOfElements angle:(float)angle ;
	+ (void)reset:(NSArray*)arrayOfElements ;
	
	+ (void)projectElevation:(NSArray*)arrayOfElements angle:(float)angle ;
	
	//	v0.75c
	+ (void)initializeUnitVectors:(GeometryInfo*)info ;
	+ (void)rotateUnitVectorsX:(GeometryInfo*)info angle:(float)angle ;
	+ (void)rotateUnitVectorsZ:(GeometryInfo*)info angle:(float)angle ;

	
	@end

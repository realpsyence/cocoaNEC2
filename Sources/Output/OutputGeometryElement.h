//
//  OutputGeometryElement.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/1/07.


	#import <Cocoa/Cocoa.h>
	#import "coordinate.h"

	typedef struct {
		int tag ;
		int segment ;
		float length ;
		float real ;
		float imag ;
		float mag ;
		float phase ;
		float current ;					//  mag normalized to 1.0
		float angle ;					//  phase relative to largest current, normalized to 1 (1.0 == 360 degrees)
		float currentGradient ;
		float maxCurrent ;				//  v0.81e used for normalizing real and imaginary component in WireCurrent
		Coordinate coord ;
		Coordinate end[2] ;
	} GeometryInfo ;
	
	typedef struct {
		GeometryInfo v[4] ;
	} UnitVectors ;

	@interface OutputGeometryElement : NSObject {
		GeometryInfo g ;
	}
	
	- (id)initWithLine:(char*)string ;
	- (GeometryInfo*)info ;
	- (int)tag ;
	
	- (NSComparisonResult)compareZ:(OutputGeometryElement*)cpr ;

	@end

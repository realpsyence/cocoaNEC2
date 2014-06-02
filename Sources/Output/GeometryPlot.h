//
//  GeometryPlot.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/2/07.

	#import <Cocoa/Cocoa.h>
	#import "coordinate.h"
	#import "OutputTypes.h"


	@interface GeometryPlot : NSObject {
		NSMutableArray *geometryElements ;
		NSArray *structureArray ;
		Coordinate centroid ; 
		float wavelength ;
	}

	- (id)initWithStructure:(NSArray*)arrayOfStructures ;
	- (void)updateGeometryInfo:(NSArray*)newArray exceptions:(NSArray*)exceptions options:(GeometryOptions*)options frequency:(float)currentFrequency ;
	
	
	@end

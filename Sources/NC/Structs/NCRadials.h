//
//  NCRadials.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/23/07.


	#import <Cocoa/Cocoa.h>


	@interface NCRadials : NSObject {
		int numberOfElements ;
		double x, y, z ;
		double length, radius ;
	}

	+ (id)radialsWithElements:(int)elements x:(double)ix y:(double)iy z:(double)iz length:(double)ilength radius:(double)iradius ;

	- (NSArray*)geometryCards:(int)tag ;

	@end

//
//  Feedpoint.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/22/07.

	#import <Cocoa/Cocoa.h>


	typedef struct {
		double vr, vi ;
		double cr, ci ;
		double zr, zi ;
		double gr, gi ;
		double power ;
		int tag ;
		int segment ;
		double frequency ;
		Boolean currentSource ;		//  z and g are swapped
		
		int tagOfDestination ;
		int segmentOfDestination ;
		
	} FeedpointInfo ;

	@interface Feedpoint : NSObject {
		FeedpointInfo w ;
	}

	- (id)initWithLine:(char*)string frequency:(double)frequency exceptions:(NSArray*)exceptions ;
	- (FeedpointInfo*)info ;
	
	@end

//
//  Exception.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/23/07.

	#import <Cocoa/Cocoa.h>
	#import "Versions.h"


	@interface Exception : NSObject {
		int wireType ;
		int tag ;
		int tagOfTarget ;
		int segmentOfTarget ;
	}
	
	+ (id)exceptionForRadial:(int)wireTag ;	
	+ (id)exceptionForCurrentSource:(int)wireTag targetTag:(int)targetTag targetSegment:(int)targetSegment ;
	+ (id)exceptionForTermination:(int)wireTag targetTag:(int)targetTag targetSegment:(int)targetSegment ;
	
	- (int)wireType ;
	- (intType)tag ;
	- (int)tagOfTarget ;
	- (int)segmentOfTarget ;


	#define	RADIALEXCEPTION			1
	#define	CURRENTEXCEPTION		2
	#define	TERMINATIONEXCEPTION	3

	@end

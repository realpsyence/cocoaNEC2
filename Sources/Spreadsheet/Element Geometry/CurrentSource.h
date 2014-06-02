//
//  CurrentSource.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/10/07.

	#import "WireGeometry.h"
	#import "Expression.h"

	//  Note: this entire class has been deprecated

	@interface CurrentSource : WireGeometry {
		WireGeometry *attachedToWire ;
		int targetTag ;
		int targetSegment ;
		double from[3] ;
		double to[3] ;
		double unitVector[3] ;
		double current[2] ;
	}
	
	- (id)initAsAttachmentTo:(WireGeometry*)wire ;
	
	- (NSArray*)geometryCards:(Expression*)e tag:(int)tag displacement:(double)d ;
	- (NSArray*)generateExcitationAndNetwork ;
	
	- (int)targetTag ;
	- (int)targetSegment ;
	
	@end

//
//  WireGeometry.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/7/07.


	#import "ElementGeometry.h"

	typedef struct {
		int segments ;
		double radius ;
		double from[3], to[3] ;
		int excitationKind ;			//  0 = none, 1 = voltage, 2 = current, 3 = Hollerith
		int tag ;
		int excitationLocation ;		//  segment number (1 based)
		double excitationVector[2] ;	//  real and imaginary parts of vooltage or current
	} WireInfo ;

	@interface WireGeometry : ElementGeometry {
		WireInfo info ;
	}
	
	- (WireInfo*)info ;
	
	- (NSString*)radiusFormula ;
	- (void)setRadiusFormula:(NSString*)str ;
	
	- (NSString*)segmentsFormula ;
	- (void)setSegmentsFormula:(NSString*)str ;
	
	@end

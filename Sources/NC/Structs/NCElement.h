//
//  NCElement.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/20/07.

#import "NCGeometry.h"
#import "formats.h"

@interface NCElement : NCGeometry {
	int tag ;
}

- (NSArray*)geometryCards ;
- (NSArray*)excitationCards ;
- (NSArray*)networkCardsForCurrentExcitation ;
- (NSArray*)loadCards ;
- (NSArray*)loadCardsForInsulatedWire ;
- (NSArray*)networkCardsForFrequency:(double)frequency ;
- (NSArray*)currentGeometryCards:(int)tags ;
- (double)segmentLength ;		//  v0.81


@end

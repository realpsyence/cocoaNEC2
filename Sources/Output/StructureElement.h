//
//  StructureElement.h
//  cocoaNEC
//
//  Created by Kok Chen on 4/14/08.
//  Copyright 2008 Kok Chen, W7AY. All rights reserved.
//

	#import <Cocoa/Cocoa.h>
	#import "coordinate.h"

	typedef struct {
		int wire ;
		int segments ;
		Coordinate end[2] ;
		float radius ;
		int startSegment ;
		int endSegment ;
		int tag ;					//  NOTE: tag is not unique, different wires could have the same tag.  segment numbers (startSegment, endSegment) are however unique.
	} StructureInfo ;

	@interface StructureElement : NSObject {
		StructureInfo g ;
	}
	
	- (id)initWithLine:(char*)string ;
	- (id)initWithLine:(char*)string wireNumber:(int)wireNumber segments:(int)segments start:(int)start tag:(int)tag ;
	- (id)initWithStructureElement:(StructureElement*)old ;
	
	- (StructureInfo*)info ;
	- (int)tag ;
	
	@end

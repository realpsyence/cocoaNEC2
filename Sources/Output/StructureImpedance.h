//
//  StructureImpedance.h
//  cocoaNEC
//
//  Created by Kok Chen on 4/16/08.
//  Copyright 2008 Kok Chen, W7AY. All rights reserved.
//

	#import <Cocoa/Cocoa.h>
	#import "coordinate.h"

	typedef struct {
		int tag ;
		int segment ;
		int type ;
	} LoadInfo ;

	@interface StructureImpedance : NSObject {
		LoadInfo g ;
	}
	
	- (id)initWithLine:(char*)string ;
	- (LoadInfo*)info ;
	- (int)tag ;
	
	//  type
	#define	DISTRIBUTED			0x80
	#define	FIXEDIMPEDANCE		1
	#define	LOADEDWIRE			( 2 | DISTRIBUTED )
	#define	PARALLEL			3
	#define	SERIES				4
	#define	DISTRIBUTEDPARALLEL	( 5 | DISTRIBUTED )
	#define	DISTRIBUTEDSERIES	( 6 | DISTRIBUTED )
	
	@end

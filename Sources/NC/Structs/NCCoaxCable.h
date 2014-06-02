//
//  NCCoaxCable.h
//  cocoaNEC
//
//  Created by Kok Chen on 4/23/12.
//  Copyright 2012 Kok Chen, W7AY. All rights reserved.
//

#import "NCWire.h"
#import "NCStructs.h"
#import <complex.h>


@class NCCoax ;

@interface NCCoaxCable : NSObject {
	ParallelLine original ;
	ParallelLine shortened ;
	
	NCCoax *coax ;
	RuntimeStack *stack ;
}

- (id)initFrom:(NCWire*)element1 to:(NCWire*)element2 coax:(NCCoax*)inCoax params:(CoaxCableParams*)modifier stack:(RuntimeStack*)inStack ;


@end

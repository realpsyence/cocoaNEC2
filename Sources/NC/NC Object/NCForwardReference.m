//
//  NCForwardReference.m
//  cocoaNEC
//
//  Created by Kok Chen on 5/26/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCForwardReference.h"


@implementation NCForwardReference

- (id)initWithVariable:(const char*)string type:(int)inType
{
	self = [ super initWithVariable:string type:inType ] ;
	if ( self ) {
		forwardReference = YES ;
	}
	return self ;
}

@end

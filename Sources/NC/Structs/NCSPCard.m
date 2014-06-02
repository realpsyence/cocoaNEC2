//
//  NCSPCard.m
//  cocoaNEC
//
//  Created by Kok Chen on 5/31/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCSPCard.h"


@implementation NCSPCard

//	SP, SC and SM cards

- (id)initWithRuntime:(RuntimeStack*)rt
{
	self = [ super initWithRuntime:rt ] ;
	if ( self ) {
		i1 = 0 ;
	}
	return self ;
}


- (NSArray*)geometryCards
{
	NSString *card ;
	
	card = [ [ NSString alloc ] initWithFormat:@"%2s%3d%5d%10s%10s%10s%10s%10s%10s%10s", type, i1, i2, dtos(f1), dtos(f2), dtos(f3), dtos(f4), dtos(f5), dtos(f6), "" ] ;
	return [ NSArray arrayWithObjects:card, nil ] ;
}

@end

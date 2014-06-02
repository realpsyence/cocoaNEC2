//
//  NCGRCard.m
//  cocoaNEC
//
//  Created by Kok Chen on 5/31/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCGRCard.h"


@implementation NCGRCard

//  handles both GR andGX cards
- (NSArray*)geometryCards
{
	NSString *card ;
	
	card = [ [ NSString alloc ] initWithFormat:@"%2s%3d%5d%10s%10s%10s%10s%10s%10s%10s", type, i1, i2, "", "", "", "", "", "", "" ] ;
	return [ NSArray arrayWithObjects:card, nil ] ;
}

@end

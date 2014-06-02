//
//  NCGCCard.m
//  cocoaNEC
//
//  Created by Kok Chen on 5/31/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCGCCard.h"


@implementation NCGCCard

- (NSArray*)geometryCards
{
	NSString *card ;
	
	card = [ [ NSString alloc ] initWithFormat:@"%2s        %10s%10s%10s%10s%10s%10s%10s", type, dtos(f1), dtos(f2), dtos(f3), "", "", "", "" ] ;
	return [ NSArray arrayWithObjects:card, nil ] ;
}

@end

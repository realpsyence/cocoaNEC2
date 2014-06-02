//
//  NCGSCard.m
//  cocoaNEC
//
//  Created by Kok Chen on 5/31/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCGSCard.h"


@implementation NCGSCard

- (NSArray*)geometryCards
{
	NSString *card ;
	
	//  note: nec2c requires the two zero fields
	card = [ [ NSString alloc ] initWithFormat:@"%2s%3d%5d%10s%10s%10s%10s%10s%10s%10s", type, 0, 0, dtos(f1), "", "", "", "", "", "" ] ;
	return [ NSArray arrayWithObjects:card, nil ] ;
}

@end

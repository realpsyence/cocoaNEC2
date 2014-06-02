//
//  NCEXCard.m
//  cocoaNEC
//
//  Created by Kok Chen on 5/31/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCEXCard.h"


@implementation NCEXCard

- (id)initWithRuntime:(RuntimeStack*)rt
{
	self = [ super initWithRuntime:rt ] ;
	if ( self ) {
		i1 = 0 ;
		generate = 0 ;
	}
	return self ;
}

//	generate =	0	Excitation
//				1	Load
//				2	NetWork
- (void)setGenerate:(int)state 
{
	generate = state ;
}

- (NSArray*)geometryCards
{
	//  return no geometry cards
	return [ NSArray array ] ;
}

//	EX card
- (NSArray*)excitationCards
{
	NSString *card ;
	
	if ( generate != EXCITATIONCARD ) return [ NSArray array ] ;
	card = [ [ NSString alloc ] initWithFormat:@"%2s%3d%5d%5d%5d%10s%10s%10s%10s%10s%10s", type, i1, i2, i3, i4, dtos(f1), dtos(f2), dtos(f3), dtos(f4), dtos(f5), dtos(f6) ] ;
	return [ NSArray arrayWithObjects:card, nil ] ;
}

//	LD card
- (NSArray*)loadCards
{
	NSString *card ;
	
	if ( generate != LOADCARD ) return [ NSArray array ] ;
	card = [ [ NSString alloc ] initWithFormat:@"%2s%3d%5d%5d%5d%10s%10s%10s%10s%10s%10s", type, i1, i2, i3, i4, dtos(f1), dtos(f2), dtos(f3), "", "", "" ] ;
	return [ NSArray arrayWithObjects:card, nil ] ;
}

- (NSArray*)networkCards
{
	NSString *card ;
	
	if ( generate != NETWORKCARD ) return [ NSArray array ] ;
	card = [ [ NSString alloc ] initWithFormat:@"%2s%3d%5d%5d%5d%10s%10s%10s%10s%10s%10s", type, i1, i2, i3, i4, dtos(f1), dtos(f2), dtos(f3), dtos(f4), dtos(f5), dtos(f6) ] ;
	return [ NSArray arrayWithObjects:card, nil ] ;
}

@end

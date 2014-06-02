//
//  NCCard.m
//  cocoaNEC
//
//  Created by Kok Chen on 5/30/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCCard.h"


@implementation NCCard


//  NCCards are saved in an NCFunctionObject
- (id)init
{
	self = [ super init ] ;
	if ( self ) {
		tag = 0 ;
		type[0] = '*' ;
		type[1] = '*' ;
		type[2] = 0 ;
	}
	return self ;
}

- (void)setCardType:(char*)value
{
	type[0] = value[0] ;
	type[1] = value[1] ;
	type[2] = 0 ;
}

@end

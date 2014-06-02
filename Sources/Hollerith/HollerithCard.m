//
//  HollerithCard.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/20/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "HollerithCard.h"


@implementation HollerithCard


- (id)init
{
	self = [ super init ] ;
	if ( self ) {
		image = note = nil ;
		ignore = NO ;
	}
	return self ;
}

- (NSString*)imageField
{
	return ( image != nil ) ? image : @"" ;
}

- (void)setImage:(NSString*)str
{
	if ( image ) [ image release ] ;
	image = [ [ NSString alloc ] initWithString:str ] ;
}

- (NSString*)ignoreField
{
	return ( ignore ) ? @"*" : @"" ;
}

- (Boolean)ignore
{
	return ignore ;
}

- (void)setIgnore:(NSString*)str
{
	int length ;
	ignore = NO ;
	
	if ( str == nil ) return ;
	length = [ str length ] ;
	if ( length == 0 ) return ;
	
	if ( length == 1 ) {
		ignore = ( [ str characterAtIndex:0 ] == '*' ) ;
		return ;
	}
	ignore = ( [ str characterAtIndex:0 ] == '*' || [ str characterAtIndex:1 ] == '*' ) ;
}

- (NSString*)noteField
{
	return ( note != nil ) ? note : @"" ;
}

- (void)setNote:(NSString*)str
{
	if ( note ) [ note release ] ;
	note = [ [ NSString alloc ] initWithString:str ] ;
}

@end

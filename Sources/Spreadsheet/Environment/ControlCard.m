//
//  ControlCard.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/15/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "ControlCard.h"


@implementation ControlCard

- (id)init
{
	self = [ super init ] ;
	if ( self ) {
		hollerith = nil ;
	}
	return self ;
}

- (NSString*)hollerith
{
	return ( ( !hollerith ) ? @"" : hollerith ) ;
}

- (void)setHollerith:(NSString*)str
{
	if ( hollerith ) [ hollerith autorelease ] ;
	hollerith = [ [ NSString alloc ] initWithString:str ] ;
}

- (NSString*)comment
{
	return ( ( !comment ) ? @"" : comment ) ;
}

- (void)setComment:(NSString*)str
{
	if ( comment ) [ comment autorelease ] ;
	comment = [ [ NSString alloc ] initWithString:str ] ;
}

- (NSString*)ignoreField
{
	return ( ignore ) ? @"*" : @"" ;
}

- (void)setIgnore:(NSString*)str
{
	int length ;
	
	if ( str != nil ) {
		length =  [ str length ] ;
		if ( length == 1 || length == 2 ) {
			ignore = ( [ str characterAtIndex:length-1 ] == '*' ) ;
			return ;
		}
	}
	ignore = NO ;
}

- (Boolean)ignoreCard
{
	return ignore ;
}

- (NSDictionary*)dictForCard
{
	NSMutableDictionary *dict ;
	
	dict = [ [ NSMutableDictionary alloc ] init ] ;
	[ dict setObject:[ [ self hollerith ] uppercaseString ] forKey:@"hollerith" ] ;
	[ dict setObject:[ self ignoreField ] forKey:@"ignore" ] ;
	[ dict setObject:[ self comment ] forKey:@"comment" ] ;
	return dict ;
}

- (void)setCardFromDict:(NSDictionary*)dict
{
	[ self setHollerith:[ dict objectForKey:@"hollerith" ] ] ;
	[ self setIgnore:[ dict objectForKey:@"ignore" ] ] ;
	[ self setComment:[ dict objectForKey:@"comment" ] ] ;
}

@end

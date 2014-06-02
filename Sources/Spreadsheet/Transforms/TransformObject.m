//
//  TransformObject.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/19/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "TransformObject.h"


@implementation TransformObject

- (id)init
{
	int i ;
	
	self = [ super init ] ;
	if ( self ) {
		name = nil ;
		transform = [ [ NSMutableArray alloc ] initWithCapacity:6 ] ;
		for ( i = 0; i < 6; i++ ) [ transform insertObject:@"0" atIndex:i ] ;
		plist = nil ;
	}
	return self ;
}

- (void)dealloc
{
	if ( name ) [ name autorelease ] ;
	[ transform autorelease ] ;
	[ super dealloc ] ;
}

- (Boolean)empty
{
	int i ;
	
	if ( name && [ name length ] > 0 )  return NO ;
	for ( i = 0; i < 6; i++ ) {
		if ( [ [ transform objectAtIndex:i ] length ] > 0 ) return NO ;
	}
	return YES ;
}

- (NSString*)name
{
	return ( ( !name ) ? @"" : name ) ;
}

- (void)setName:(NSString*)str
{
	if ( name ) [ name autorelease ] ;
	name = [ [ NSString alloc ] initWithString:str ] ;
}

- (NSString*)valueAtIndex:(int)i
{
	return [ transform objectAtIndex:i ] ;
}

- (void)setValue:(NSString*)str atIndex:(int)i
{
	if ( str == nil ) str = @"" ;
	[ transform replaceObjectAtIndex:i withObject:str ] ;
}

- (NSArray*)transform
{
	return transform ;
}

- (NSMutableDictionary*)makeTransform 
{
	if ( [ self empty ] == NO ) {
		plist = [ [ NSMutableDictionary alloc ] init ] ;
		[ plist setValue:[ self name ] forKey:@"name" ] ;
		[ plist setValue:transform forKey:@"transform" ] ;
		return plist ;
	}
	return nil ;
}

- (void)releaseTransform
{
	if ( plist ) {
		[ plist removeAllObjects ] ;
		[ plist release ] ;
		plist = nil ;
	}
}

- (void)restoreTransform:(NSDictionary*)dict
{
	NSArray *array ;
	int i ;
	
	[ self setName:[ dict valueForKey:@"name" ] ] ;
	array = [ dict valueForKey:@"transform" ] ;
	for ( i = 0; i < 6; i++ ) [ self setValue:[ array objectAtIndex:i ] atIndex:i ] ;
}

@end

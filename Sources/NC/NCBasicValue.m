//
//  NCBasicValue.m
//  cocoaNEC
//
//  Created by Kok Chen on 1/17/12.
//  Copyright 2012 Kok Chen, W7AY. All rights reserved.
//

#import "NCBasicValue.h"

//	v0.76 -- arrays in NCBasicValue are NSArray of NCValue instead of NCObjects (in NCValue).
//	It is used for saving and restoring stack frames in NCFunction

@implementation NCBasicValue


+ (id)basicValueWithValue:(NCValue*)value
{
	NCBasicValue *newValue ;
	
	newValue = [ [ NCBasicValue alloc ] init ] ;
	[ newValue setBasicValueFromValue:value withType:[ value type ] ] ;
	return [ newValue autorelease ] ;
}

//	same as setFrom:withType, but arrays are arrays of NCValue
- (void)setBasicValueFromValue:(NCValue*)v withType:(int)inType
{
	int i, count ;
	NSArray *p ;
	NCValue *value ;
	NCObject *object ;
	
	type = inType ;
	intValue = [ v intValue ] ;
	realValue = [ v doubleValue ] ;
	string = [ v stringValue ] ;
	
	if ( elementValue != nil ) [ elementValue autorelease ] ;
	elementValue = ( [ v elementValue ] != nil )  ? [ [ v elementValue ] retain ] : nil ;
	
	if ( coaxValue != nil ) [ coaxValue autorelease ] ;	//  v0.81b
	coaxValue = ( [ v coaxValue ] != nil )  ? [ [ v coaxValue ] retain ] : nil ;
	
	if ( transformValue != nil ) [ transformValue autorelease ] ;
	transformValue = ( [ v transformValue ] != nil ) ? [ [ NCTransform transformWithTransform:[ v transformValue ] ] retain ] : nil ;
	
	if ( vectorValue != nil ) [ vectorValue autorelease ] ;
	vectorValue = ( [ v vectorValue ] != nil ) ? [ [ NCVector vectorWithVector:[ v vectorValue ] ] retain ] : nil ;
	
	p = [ v array ] ;
	if ( p == nil ) {
		//  source NCValue has no array
		if ( array != nil ) [ array release ] ;
		array = nil ;
	}
	else {
		//  source NCValue has array
		if ( array == nil ) {
			//  no local array, create one
			array = [ [ NSMutableArray alloc ] init ] ;
		}
		else {
			//  else, just clear array
			[ array removeAllObjects ] ;
		}
		//  add elements from source NSArray, create new NCValue objects
		count = [ p count ] ;
		for ( i = 0; i < count; i++ ) {
			object = [ p objectAtIndex:i ] ;
			value = [ object value ] ;
			[ array addObject:[ NCBasicValue basicValueWithValue:value ] ] ;
		} 
	}
}



@end

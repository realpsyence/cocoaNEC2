//
//  NCSymbolTable.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/16/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "NCSymbolTable.h"
#import "NCFunctionObject.h"

//	Symbol table consists of entries of NSObjects

@implementation NCSymbolTable

- (id)initWithCapacity:(int)capacity parser:(NCParser*)inParser
{
	self = [ super init ] ;
	if ( self ) {
		parser = inParser ;
		actualArray = [ [ NSMutableArray alloc ] initWithCapacity:capacity ] ;
	}
	return self ;
}

- (id)initWithSymbolTable:(NCSymbolTable*)globals parser:(NCParser*)inParser 
{
	self = [ super init ] ;
	if ( self ) {
		parser = inParser ;
		actualArray = [ [ NSMutableArray alloc ] initWithArray:[ globals actualArray ] ] ;		// v 0.35
	}
	return self ;
}

- (NSArray*)actualArray				//  v 0.35
{
	return actualArray ;
}

- (void)dealloc
{
	[ actualArray release ] ;
	[ super dealloc ] ;
}

- (NCObject*)containsObject:(NCObject*)object
{
	int i, count ;
	NSString *name ;
	NCObject *obj ;
	
	name = [ object name ] ;
	count = [ self count ] ;
	for ( i = 0; i < count; i++ ) {
		obj = [ actualArray objectAtIndex:i ] ;
		if ( [ name isEqualToString:[ obj name ] ] ) return obj ;
	}
	return nil ;
}

- (NCObject*)containsIdent:(NSString*)name ;
{
	int i, count ;
	NCObject *obj ;
	
	count = [ self count ] ;
	for ( i = 0; i < count; i++ ) {
		obj = [ actualArray objectAtIndex:i ] ;
		if ( obj && [ name isEqualToString:[ obj name ] ] ) return obj ;
	}
	return nil ;
}

- (void)setDouble:(double)value forIdentifier:(NSString*)ident
{
	NCObject *var = [ self containsIdent:ident ] ;
	if ( var ) [ var setRealValue:value ] ;
}

- (NCObject*)addObject:(NCObject*)object
{
	NCObject *obj ;
	
	obj = [ self containsObject:object ] ;
	if ( obj != nil ) {
		[ parser setError:[ NSString stringWithFormat:@"variable '%s' has been defined previously", [ [ object name ] UTF8String ] ] flush:NO ] ;
		[ object release ] ;
		return obj ;
	}
	[ actualArray addObject:object ] ;
	[ object autorelease ] ;		//  v0.64
	return object ;
}

- (NCObject*)addFunctionObject:(NCFunctionObject*)function
{
	NCObject *obj ;
	
	obj = [ self containsObject:function ] ;
	if ( obj ) {
		[ parser setError:[ NSString stringWithFormat:@"function '%s' has been defined previously", [ [ function name ] UTF8String ] ] flush:NO ] ;
		[ function release ] ;
		return obj ;
	}
	[ actualArray addObject:function ] ;
	[ function autorelease ] ;		//  v0.64
	return function ;
}

- (int)count
{
	return [ actualArray count ] ;
}

- (NCObject*)symbolAtIndex:(int)index
{
	return [ actualArray objectAtIndex:index ] ;
}

- (void)getObjects:(id *)aBuffer range:(NSRange)aRange
{
	[ actualArray getObjects:aBuffer range:aRange ] ;
}

- (void)dumpSymbols
{
	int i, count = [ actualArray count ] ;
	NCObject *sym ;
	
	for ( i = 0; i < count; i++ ) {
		sym = [ actualArray objectAtIndex:i ] ;
	}
}

@end

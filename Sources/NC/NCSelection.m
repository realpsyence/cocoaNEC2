//
//  NCSelection.m
//  cocoaNEC
//
//  Created by Kok Chen on 10/4/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "NCSelection.h"
#import "NCExpression.h"
#import "NCStatement.h"


@implementation NCSelection

//	v0.70 added function pointer so return statment in if and else clase will work
- (id)initWithParser:(NCParser*)inParser symbols:(NCSymbolTable*)symbolList enclosingFunction:(NCFunction*)function iterateLevel:(int)level
{
	self = [ super initWithParser:inParser symbols:symbolList enclosingFunction:function iterateLevel:level ] ;
	if ( self ) {
		ifClause = nil ;
		elseClause = nil ;
		expr = nil ;
		enclosingFunction = function ;
	}
	return self ;
}

- (void)dealloc
{
	if ( ifClause ) [ ifClause release ] ;
	if ( elseClause ) [ elseClause release ] ;
	if ( expr ) [ expr release ] ;
	[ super dealloc ] ;
}

- (Boolean)parse
{
	token = [ parser nextToken ] ;		// step past "if"
	line = [ parser line ] ;
	
	//  expect LPAREN
	if ( token != LPAREN ) {
		[ parser setError:@"left parenthesis expected after 'if'" flush:YES ] ;
		return NO ;
	}
	token = [ parser nextToken ] ;
	
	expr = [ [ NCExpression alloc ] initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel ] ;
	if ( [ expr parse ] == NO ) {
		[ expr release ] ;
		expr = nil ;
		return NO ;
	}
	
	token = [ parser token ] ;
	if ( token != RPAREN ) {
		[ parser setError:@"right parenthesis expected after expression in 'if'" flush:YES ] ;
		if ( expr ) [ expr release ] ;
		expr = nil ;
		return NO ;
	}
	token = [ parser nextToken ] ;	//  scan past RPAREN
	
	ifClause = [ [ NCStatement alloc ]  initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel ] ;
	
	if ( [ ifClause parse ] == NO ) {
		[ expr release ] ;
		expr = nil ;
		[ ifClause release ] ;
		ifClause = nil ;
		return NO ;
	}
	//  else clause
	token = [ parser token ] ;	
	if ( token == ELSECLAUSE ) {
		token = [ parser nextToken ] ;	//  scan past "else"
		elseClause = [ [ NCStatement alloc ]  initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel ] ;
		if ( [ elseClause parse ] == NO ) {
			[ expr release ] ;
			expr = nil ;
			[ ifClause release ] ;
			[ elseClause release ] ;
			ifClause = elseClause = nil ;
			return NO ;
		}
	}
	return YES ;	
}

- (NCValue*)execute:(RuntimeStack*)inStack asReference:(Boolean)asReference
{
	int exprValue ;
	NCValue *value ;
	
	stack = inStack ;
	exprValue = [ [ expr execute:stack asReference:asReference ] intValue ] ;
	
	if ( exprValue == 0 ) {
		//  false, execute else branch if there is one
		if ( elseClause ) {
			value = [ elseClause execute:stack asReference:asReference ] ;
			if ( [ value returnFlag ] == YES ) return value ;
			if ( value && [ value isBreakValue ] ) return [ NCValue breakValue ] ;
		}
		return [ NCValue valueWithInt:0 ] ;
	}	
	if ( ifClause ) {
		value = [ ifClause execute:stack asReference:asReference ] ;
		if ( [ value returnFlag ] == YES ) return value ;
		if ( value && [ value isBreakValue ] ) return [ NCValue breakValue ] ;
		return [ NCValue valueWithInt:1 ] ;
	}
	return [ NCValue undefinedValue ] ;
}

@end

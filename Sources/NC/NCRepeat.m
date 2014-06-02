//
//  NCRepeat.m
//  cocoaNEC
//
//  Created by Kok Chen on 10/5/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "NCRepeat.h"
#import "NCStatement.h"
#import "NCSystem.h"

@implementation NCRepeat

- (id)initWithParser:(NCParser*)inParser symbols:(NCSymbolTable*)symbolList enclosingFunction:(NCFunction*)function iterateLevel:(int)level
{
	self = [ super initWithParser:inParser symbols:symbolList enclosingFunction:function iterateLevel:level ] ;
	if ( self ) {
		repeatClause = nil ;
	}
	return self ;
}

- (void)dealloc
{
	if ( repeatClause ) [ repeatClause release ] ;
	[ super dealloc ] ;
}

- (Boolean)parse
{
	token = [ parser nextToken ] ;		// step past "repeat"
	line = [ parser line ] ;
	
	//  expect LPAREN
	if ( token != LPAREN ) {
		[ parser setError:@"left parenthesis expected after 'repeat'" flush:YES ] ;
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
		[ parser setError:@"right parenthesis expected after expression in 'repeat'" flush:YES ] ;
		if ( expr ) [ expr release ] ;
		expr = nil ;
		return NO ;
	}
	token = [ parser nextToken ] ;	//  scan past RPAREN
	
	repeatClause = [ [ NCStatement alloc ]  initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel ] ;
	if ( [ repeatClause parse ] == NO ) {
		[ expr release ] ;
		expr = nil ;
		[ repeatClause release ] ;
		repeatClause = nil ;
		return NO ;
	}
	return YES ;	
}

- (NCValue*)execute:(RuntimeStack*)inStack asReference:(Boolean)asReference 
{
	int i, exprValue ;
	NCValue *checkBreak ;
	
	stack = inStack ;
	if ( expr == nil || repeatClause == nil ) return [ NCValue undefinedValue ] ;

	exprValue = [ [ expr execute:stack asReference:asReference ] intValue ] ;
	
	for ( i = 0; i < exprValue; i++ ) {
		//  check if break statement seen
		checkBreak = [ repeatClause execute:stack asReference:asReference ] ;
		if ( [ checkBreak returnFlag ] == YES ) return checkBreak ;
		if ( checkBreak && [ checkBreak isBreakValue ] ) break ;
		if ( [ stack->system abort ] ) break ;
	}
	return [ NCValue undefinedValue ] ;
}

@end

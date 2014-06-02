//
//  NCStatement.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/16/07.
//  Copyright 2007 Lok Chen. All rights reserved.
//

#import "NCStatement.h"
#import "NCCompound.h"
#import "NCRepeat.h"


@implementation NCStatement


- (id)initWithParser:(NCParser*)inParser symbols:(NCSymbolTable*)symbolList enclosingFunction:(NCFunction*)fn iterateLevel:(int)level
{
	self = [ super initWithParser:inParser symbols:symbolList enclosingFunction:fn iterateLevel:level ] ;
	if ( self ) {
		expression = nil ;
		ifStatement = nil ;
		whileStatement = nil ;
		repeatStatement = nil;
		compound = nil ;
	}
	return self ;
}

- (void)dealloc
{
	if ( expression ) [ expression release ] ;
	if ( ifStatement ) [ ifStatement release ] ;
	if ( whileStatement ) [ whileStatement release ] ;
	if ( repeatStatement ) [ repeatStatement release ] ;
	if ( compound ) [ compound release ] ;
	[ super dealloc ] ;
}

//	v0.52	added return statement
- (Boolean)parse
{
	int functionType, expressionType ;
	
	token = [ parser token ] ;
	line = [ parser line ] ;
	
	if ( token == LBRACE ) {
		op = COMPOUND ;
		compound = [ [ NCCompound alloc ] initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel ] ;		//  v0.70 pass in function instead of nil
		if ( [ compound parse ] == NO ) {
			[ compound release ] ;
			compound = nil ;
			return NO ;
		}
		return YES ;
	}
	
	if ( ( token & LEXPREFIX ) == STATEMENT ) {
		switch ( token ) {
		case IFSTATEMENT:
			ifStatement = [ [ NCSelection alloc ] initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel ] ;	//  v0.70 added function argument
			if ( [ ifStatement parse ] == NO ) {
				[ ifStatement release ] ;
				ifStatement = nil ;
				return NO ;
			}
			op = IFSTATEMENT ;
			return YES ;
		case WHILESTATEMENT:
			whileStatement = [ [ NCIterate alloc ] initWithParser:parser symbols:symbols  enclosingFunction:enclosingFunction iterateLevel:iterateLevel+1 ] ;
			if ( [ whileStatement parse ] == NO ) {
				[ whileStatement release ] ;
				whileStatement = nil ;
				return NO ;
			}
			op = WHILESTATEMENT ;
			return YES ;
		case REPEATSTATEMENT:
			repeatStatement = [ [ NCRepeat alloc ] initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel+1 ] ;
			if ( [ repeatStatement parse ] == NO ) {
				[ repeatStatement release ] ;
				repeatStatement = nil ;
				return NO ;
			}
			op = REPEATSTATEMENT ;
			return YES ;
		case BREAKSTATEMENT:
			if ( iterateLevel < 1 ) {
				[ parser setError:@"'break' statement is only allowed inside a while block" flush:YES ] ;
				return NO ;
			}
			op = BREAKSTATEMENT ;
			token = [ parser nextToken ] ;	//  skip past "break"
			if ( token == SEMICOLON ) {
				[ parser nextToken ] ;		//  skip past semicolon
				return YES ;
			}
			break ;
		case RETURNSTATEMENT:
			op = RETURNSTATEMENT ;
			token = [ parser nextToken ] ;	//  skip past "return"
			
			//  figure out the function type
			functionType = [ enclosingFunction type ] ;
			if ( functionType == MODELBLOCK || functionType == CONTROLBLOCK ) functionType = VOIDTYPE ;

			if ( token == SEMICOLON ) {
				//  void return statement
				if ( functionType != VOIDTYPE ) [ parser setError:[ NSString stringWithFormat:@"return statement of a non-void function requires a value.", [ parser tokenType:token ] ] flush:YES ] ;
				expression = nil ;			//  void return statement
				[ parser nextToken ] ;		//  skip past semicolon
				return YES ;
			}
			expression = [ [ NCExpression alloc ] initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel ] ;
			if ( [ expression parse ] == NO ) {
				[ expression release ] ;				//  quit compund statement if there is an error
				expression = nil ;
				return NO ;
			}
			if ( functionType == VOIDTYPE ) {
				[ parser setError:[ NSString stringWithFormat:@"returning a value in a void function.", [ parser tokenType:token ] ] flush:YES ] ;
			}
			else {
				expressionType = [ expression type ] ;
				if ( functionType == REALTYPE ) functionType = INTTYPE ;		//  can be converted
				if ( expressionType == REALTYPE ) expressionType = INTTYPE ;
				if ( expressionType != functionType ) {
					[ parser setError:[ NSString stringWithFormat:@"returning a value that is incompatible with function type.", [ parser tokenType:token ] ] flush:NO ] ;
				}
			}
			token = [ parser token ] ;
			if ( token != SEMICOLON ) {
				[ parser setError:[ NSString stringWithFormat:@"missing semicolon, encountered %s instead", [ parser tokenType:token ] ] flush:YES ] ;
				return NO ;
			}
			[ parser nextToken ] ;
			return YES ;
		default:
			[ parser setError:@"bad syntax?" flush:YES ] ;
		}
		return NO ;
	}
	expression = [ [ NCExpression alloc ] initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel ] ;
	if ( [ expression parse ] == NO ) {
		[ expression release ] ;				//  quit compund statement if there is an error
		expression = nil ;
		return NO ;
	}
	token = [ parser token ] ;
	
	if ( token != SEMICOLON ) {
		[ parser setError:[ NSString stringWithFormat:@"missing semicolon, encountered %s instead", [ parser tokenType:token ] ] flush:YES ] ;
		return NO ;
	}
	[ parser nextToken ] ;
	return YES ;
}

- (NCValue*)execute:(RuntimeStack*)inStack asReference:(Boolean)asReference
{
	NCValue *returnValue ;
	
	stack = inStack ;

	switch ( op ) {
	case COMPOUND:
		return [ compound execute:stack asReference:asReference ] ;
	case IFSTATEMENT:
		if ( ifStatement ) {
			returnValue = [ ifStatement execute:stack asReference:asReference ] ;
			return returnValue ;
		}
		return [ NCValue valueWithInt:0 ] ;
	case WHILESTATEMENT:
		if ( whileStatement ) return [ whileStatement execute:stack asReference:asReference ] ;
		return [ NCValue valueWithInt:0 ] ; 
	case REPEATSTATEMENT:
		if ( repeatStatement ) return [ repeatStatement execute:stack asReference:asReference ] ;
		return [ NCValue valueWithInt:0 ] ; 
	case BREAKSTATEMENT:
		return [ NCValue breakValue ] ;
	case RETURNSTATEMENT:
		// check if VOID type, if not evaluate expression
		//  v0.56
		returnValue = ( expression == nil ) ? [ NCValue valueWithInt:0 ] : [ NCValue valueWithValue:[ expression execute:stack asReference:asReference ] ] ;
		[ returnValue setReturnFlag:YES ] ;
		
		return returnValue ;
	}
	return [ expression execute:stack asReference:asReference ] ;
}

@end

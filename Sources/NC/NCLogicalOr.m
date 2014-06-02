//
//  NCLogicalOr.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/19/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "NCLogicalOr.h"
#import "NCLogicalAnd.h"


@implementation NCLogicalOr

- (id)initWithParser:(NCParser*)inParser symbols:(NCSymbolTable*)symbolList enclosingFunction:(NCFunction*)function iterateLevel:(int)level
{
	self = [ super initWithParser:inParser symbols:symbolList enclosingFunction:function iterateLevel:level ] ;
	if ( self ) {
		nodeType = "LogicalOR" ;
	}
	return self ;
}

- (Boolean)parse
{
	token = [ parser token ] ;
	line = [ parser line ] ;
		
	left = [ [ NCLogicalAnd alloc ]  initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel ] ;
	if ( [ left parse ] ) {
		token = [ parser token ] ;
		while ( 1 ) {
			switch ( token ) {
			case LOGICALOR:
				op = token ;
				[ parser nextToken ] ;
				right = [ [ NCLogicalAnd alloc ]  initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel ] ;
				if ( ![ right parse ] ) return NO ;
				type = INTTYPE ;
				break ;
			default:
				op = LOGICALAND ;
				type = [ left type ] ;
				lvalue = [ left lvalue ] ;
				return YES ;
			}
			token = [ parser token ] ;
			if ( token != LOGICALOR ) return YES ;
			left = [ [ NCLogicalOr alloc ] clone:self ] ;
		}
	}
	return NO ;
}

- (NCValue*)execute:(RuntimeStack*)inStack asReference:(Boolean)asReference
{
	stack = inStack ;

	switch ( op ) {
	case LOGICALAND:
		if ( left == nil ) return [ NCValue undefinedValue ] ;
		return [ left execute:stack asReference:asReference ] ;
	case LOGICALOR:
		if ( left == nil || right == nil ) return [ NCValue undefinedValue ] ;
		return [ NCValue valueWithInt:( [ [ left execute:stack asReference:asReference ] intValue ] || [ [ right execute:stack asReference:asReference ] intValue ] ) ? 1 : 0 ] ;
	default:
		printf( "NCLogicalOr -execute with unknown op type 0x%x\n", op ) ;
		break ;
	}
	return [ NCValue undefinedValue ] ;
}

//	v0.53
- (NSString*)symbolName
{
	if ( left != nil ) return [ left symbolName ] ;
	return [ super symbolName ] ;
}


@end

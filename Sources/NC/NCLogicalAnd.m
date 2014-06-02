//
//  NCLogicalAnd.m
//  cocoaNEC
//
//  Created by Kok Chen on 9/19/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "NCLogicalAnd.h"
#import "NCEquality.h"


@implementation NCLogicalAnd


- (id)initWithParser:(NCParser*)inParser symbols:(NCSymbolTable*)symbolList enclosingFunction:(NCFunction*)function iterateLevel:(int)level
{
	self = [ super initWithParser:inParser symbols:symbolList enclosingFunction:function iterateLevel:level ] ;
	if ( self ) {
		nodeType = "LogicalAnd" ;
	}
	return self ;
}

- (Boolean)parse
{
	token = [ parser token ] ;
	line = [ parser line ] ;
	
	left = [ [ NCEquality alloc ]  initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel ] ;
	if ( [ left parse ] ) {
		token = [ parser token ] ;
		while ( 1 ) {
			switch ( token ) {
			case LOGICALAND:
				op = token ;
				[ parser nextToken ] ;
				right = [ [ NCEquality alloc ]  initWithParser:parser symbols:symbols enclosingFunction:enclosingFunction iterateLevel:iterateLevel ] ;
				if ( ![ right parse ] ) return NO ;
				type = INTTYPE ;
				break ;
			default:
				op = LOGICALEQ ;
				type = [ left type ] ;
				lvalue = [ left lvalue ] ;
				return YES ;
			}
			token = [ parser token ] ;
			if ( token != LOGICALAND ) return YES ;
			left = [ [ NCLogicalAnd alloc ] clone:self ] ;
		}
	}
	return NO ;
}

- (NCValue*)execute:(RuntimeStack*)inStack asReference:(Boolean)asReference
{
	stack = inStack ;

	switch ( op ) {
	case LOGICALEQ:
		if ( left == nil ) return [ NCValue undefinedValue ] ;
		return [ left execute:stack asReference:asReference ] ;
	case LOGICALAND:
		if ( left == nil || right == nil ) return [ NCValue undefinedValue ] ;
		return [ NCValue valueWithInt:( [ [ left execute:stack asReference:NO ] intValue ] && [ [ right execute:stack asReference:NO ] intValue ] ) ? 1 : 0 ] ;
	default:
		printf( "NCLogicalAnd -execute with unknown op type 0x%x\n", op ) ;
		break ;
	}
	return nil ;
}

//	v0.53
- (NSString*)symbolName
{
	if ( left != nil ) return [ left symbolName ] ;
	return [ super symbolName ] ;
}

@end

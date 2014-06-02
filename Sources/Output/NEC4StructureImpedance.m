//
//  NEC4StructureImpedance.m
//  cocoaNEC
//
//  Created by Kok Chen on 4/22/12
//  Copyright 2008 Kok Chen, W7AY. All rights reserved.
//

#import "NEC4StructureImpedance.h"


@implementation NEC4StructureImpedance

//  v0.77 NEC4 format
//	v0.81 Bug with non-FIXED IMPEDANCE types
- (Boolean)parseStructure:(char*)string
{
	int tag, from, to ;
	char *types ;
	
	if ( strlen( string ) < 16 ) return NO ;
	tag = -1 ;
	sscanf( string, "%d %d %d", &tag, &from, &to ) ;
	if ( tag < 0 ) return NO ;
	
	g.tag = tag ;
	types = &string[91+11] ;	//  v0.77 different text offset in NEC-4
	g.segment = from ;
	g.type = 0x1000 ;
	if ( strncmp( types, "FIXED IMPEDANCE", 15 ) == 0 ) g.type = FIXEDIMPEDANCE ;
	else if ( strncmp( types, "  WIRE  ", 8 ) == 0 ) g.type = LOADEDWIRE ;
	else if ( strncmp( types, "PARALLEL (PER METER)", 20 ) == 0 ) g.type = DISTRIBUTEDPARALLEL ;
	else if ( strncmp( types, "PARALLEL", 8 ) == 0 ) g.type = PARALLEL ;
	else if ( strncmp( types, " SERIES (PER METER)", 18 ) == 0 ) g.type = DISTRIBUTEDSERIES ;
	else if ( strncmp( types, " SERIES", 6 ) == 0 ) g.type = SERIES ;
	
	return YES ;
}

@end

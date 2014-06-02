//
//  MPatchGeometry.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/8/07.


#import "MPatchGeometry.h"


@implementation MPatchGeometry

- (NSString*)typeString
{
	return MPatchTypeString ;
}

- (NSTextField*)transformField
{
	return mpatchTransform ;
}

- (NSString*)ncForGeometry:(int)index
{
	NSMutableString *result ;
	
	elementIndex = index ;	
	result = [ NSMutableString stringWithCapacity:128 ] ;
	[ result appendFormat:@"_e%d = multiplePatchCard(", index ] ;
	[ result appendArgument:mpatchNX addition:@"," ] ;
	[ result appendArgument:mpatchNY addition:@"," ] ;
	[ result appendArguments:mpatchFloatMatrix1 count:6 addition:@"," ] ;
	[ result appendArguments:mpatchFloatMatrix2 count:3 addition:@"," ] ;
	[ result appendTransform:[ mpatchTransform stringValue ] addition:@");\n" ] ;
	return result ;
}

//  create plist array for multiple patch
- (NSMutableDictionary*)makePlist 
{
	plist = [ self createGeometryForPlist ] ;
	[ plist setObject:[ mpatchNX stringValue ] forKey:@"NX" ] ;
	[ plist setObject:[ mpatchNY stringValue ] forKey:@"NY" ] ;
	[ plist setObject:[ self arrayForMatrix:mpatchFloatMatrix1 count:6 ] forKey:@"patchMatrix1" ] ;
	[ plist setObject:[ self arrayForMatrix:mpatchFloatMatrix2 count:3 ] forKey:@"patchMatrix2" ] ;
	[ plist setObject:[ mpatchTransform stringValue ] forKey:@"transform" ] ;
	[ self addExcitationToDict:plist ] ;
	[ self addLoadToDict:plist ] ;
	return plist ;
}

//  create multiple patch card from plist array
- (void)restoreGeometryFieldsFromDictionary:(NSDictionary*)dict
{
	NSString *string ;
	
	[ self restoreCommonGeometryFieldsFromDictionary:dict ] ;
	
	[ mpatchNX setStringValue:[ dict objectForKey:@"NX" ] ] ;
	[ mpatchNY setStringValue:[ dict objectForKey:@"NY" ] ] ;
	[ self setMatrix:mpatchFloatMatrix1 fromArray:[ dict objectForKey:@"patchMatrix1" ] count:6 ] ;
	[ self setMatrix:mpatchFloatMatrix2 fromArray:[ dict objectForKey:@"patchMatrix2" ] count:3 ] ;
	string = [ dict objectForKey:@"transform" ] ;
	if ( string == nil ) string = @"" ;
	[ mpatchTransform setStringValue:string ] ;
	[ self restoreExcitation:[ dict objectForKey:@"excitation" ] ] ;
	[ self restoreLoad:[ dict objectForKey:@"loading" ]  ] ;
	dirty = NO ;
}


@end

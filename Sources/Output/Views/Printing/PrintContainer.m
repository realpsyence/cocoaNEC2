//
//  PrintContainer.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/20/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "PrintContainer.h"
#import "Output.h"

@implementation PrintContainer

- (Boolean)setUpWithPrintInfo:(NSPrintInfo*)printInfo output:(Output*)output
{
	return NO ;
}

- (void)printWithInfo:(NSPrintInfo*)printInfo output:(Output*)output
{
	if ( [ self setUpWithPrintInfo:printInfo output:output ] ) [ self print:self ] ;
}

- (Footer*)footer
{
	return footer ;
}

- (void)setOutput:(Output*)control
{
	if ( footer ) [ footer setOutput:control ] ;
}

//	pass colors on to subviews
- (void)updateColorsFromColorWells:(ColorWells*)wells
{
	//  e.g. [ patternView updateColorsFromColorWells:wells ] ;
}

//	pass color on to subviews
- (void)changeColor:(NSColorWell*)well
{
	//  e.g. [ patternView changeColor:well ] ;
}

//  clear all pattern arrays
- (void)clearPatterns
{
}

- (id)initWithFrame:(NSRect)inFrame
{
	self = [ super initWithFrame:inFrame ] ;
	if ( self ) {
		footer = nil ;
	}
	return self ;
}

@end

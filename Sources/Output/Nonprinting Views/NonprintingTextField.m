//
//  NonprintingTextField.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/18/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "NonprintingTextField.h"


@implementation NonprintingTextField

- (void)drawRect:(NSRect)rect
{
	if ( [ NSGraphicsContext currentContextDrawingToScreen ] == NO ) return ;
	//  draw only to screen
	[ super drawRect:rect ] ;
}

@end

//
//  NonprintingSlider.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/18/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "NonprintingSlider.h"


@implementation NonprintingSlider

- (void)drawRect:(NSRect)rect
{
	if ( [ NSGraphicsContext currentContextDrawingToScreen ] == NO ) return ;
	//  draw only to screen
	[ super drawRect:rect ] ;
}

@end

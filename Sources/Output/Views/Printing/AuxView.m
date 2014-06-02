//
//  AuxView.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/24/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "AuxView.h"


@implementation AuxView

- (void)setOffScreenType:(Boolean)state
{
	drawInfoForOffScreen = state ;
}

- (id)initWithFrame:(NSRect)inFrame
{
    self = [ super initWithFrame:inFrame ] ;
	if ( self ) {
		drawInfoForOffScreen = NO ;
	}
	return self ;
}


@end

//
//  NCLine.m
//  cocoaNEC
//
//  Created by Kok Chen on 4/5/08.
//  Copyright 2008 Kok Chen, W7AY. All rights reserved.
//

#import "NCLine.h"


@implementation NCLine

//  override NCWire to keep the segments immutable
- (void)setSegments:(int)value
{
	segments = value ;
	feedSegment = ( segments+1 )/2 ;					//  v0.81
}

@end

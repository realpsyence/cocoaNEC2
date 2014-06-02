//
//  AuxPatternView.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/17/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "OutputTypes.h"
#import "AuxView.h"

@interface AuxPatternView : AuxView {
	NSMutableArray *captionArray ;
	NSColor **colors ;
}

- (void)show:(NSArray*)captionArray colors:(NSColor**)plotColor ;

@end

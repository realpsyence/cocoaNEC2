//
//  AuxSWRView.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/20/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "OutputTypes.h"
#import "AuxView.h"
#import <complex.h>

@class Output ;

@interface AuxSWRView : AuxView {
	IBOutlet Output *outputObject ; 
	NSMutableArray *captionArray ;
	NSColorWell **colorWell ;
	Boolean isScreen;
	FeedpointCache *currentFeedpoint ;
	int currentIndex ;
	int feedpoints ;
	complex z ;

	float opticalScale ;
}

- (void)show:(FeedpointCache*)current index:(int)index z:(complex)z colors:(NSColorWell**)colorWells feedpoints:(int)n ;

@end

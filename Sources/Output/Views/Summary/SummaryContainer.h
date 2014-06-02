//
//  SummaryContainer.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/20/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "PrintContainer.h"
#import "AzimuthView.h"
#import "ElevationView.h"


@interface SummaryContainer : PrintContainer {
	IBOutlet NSTextView *textView ;
	IBOutlet AzimuthView *azimuth ;				//  embedded
	IBOutlet ElevationView *elevation ;			//  embedded
}

- (PatternView*)azimuthPattern ;
- (PatternView*)elevationPattern ;
- (NSTextView*)textView ;

- (void)clearText ;
- (void)appendText:(NSString*)string ;

- (void)updateAzimuthPatternWithArray:(NSArray*)array refArray:(NSArray*)ref prevArray:(NSArray*)prev ;
- (void)updateElevationPatternWithArray:(NSArray*)array refArray:(NSArray*)ref prevArray:(NSArray*)prev ;

@end

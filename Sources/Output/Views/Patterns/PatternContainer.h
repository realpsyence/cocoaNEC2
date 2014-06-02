//
//  PatternContainer.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/19/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "PrintContainer.h"
#import "PatternView.h"

@interface PatternContainer : PrintContainer {
	IBOutlet PatternView *patternView ;
}

- (PatternView*)patternView ;
- (AuxPatternView*)auxView ;

- (void)updatePatternWithArray:(NSArray*)array refArray:(NSArray*)ref prevArray:(NSArray*)prev ;

@end

//
//  ScalarContainer.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/23/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "PrintContainer.h"
#import "AuxScalarView.h"

@class ScalarView ;

@interface ScalarContainer : PrintContainer {
	IBOutlet ScalarView *view ;
}

- (ScalarView*)scalarView ;
- (AuxScalarView*)auxView ;

@end

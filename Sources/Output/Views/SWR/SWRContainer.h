//
//  SWRContainer.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/20/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "PrintContainer.h"

@class SWRView ;
@class AuxSWRView ;

@interface SWRContainer : PrintContainer {
	IBOutlet SWRView *swrView ;
}

- (SWRView*)swrView ;
- (AuxSWRView*)auxView ;

@end

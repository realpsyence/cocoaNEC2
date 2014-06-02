//
//  Pattern3dContainer.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/21/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "PrintContainer.h"
#import "Aux3dView.h"
#import "Pattern3dView.h"

@class Output ;


@interface Pattern3dContainer : PrintContainer {
	IBOutlet Pattern3dView *view ;
	IBOutlet Aux3dView *auxView ;
}

- (Pattern3dView*)view ;

@end

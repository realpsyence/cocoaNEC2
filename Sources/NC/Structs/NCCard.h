//
//  NCCard.h
//  cocoaNEC
//
//  Created by Kok Chen on 5/30/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NCElement.h"


@interface NCCard : NCElement {
	char type[3] ;			// "GW" etc
}

- (void)setCardType:(char*)type ;


@end

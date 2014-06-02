//
//  NCEXCard.h
//  cocoaNEC
//
//  Created by Kok Chen on 5/31/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCGWCard.h"

#define	EXCITATIONCARD	0
#define	LOADCARD		1
#define	NETWORKCARD		2

@interface NCEXCard : NCGWCard {
	int generate ;
}

- (void)setGenerate:(int)state ;

@end

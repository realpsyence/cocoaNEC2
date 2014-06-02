//
//  NCPatch.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/20/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCArc.h"


@interface NCPatch : NCArc {
	WireCoord end3 ;
	WireCoord end4 ;
}

- (void)setEnd3:(WireCoord*)vector ;
- (void)setEnd4:(WireCoord*)vector ;

@end

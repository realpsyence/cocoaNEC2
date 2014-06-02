//
//  NCUnary.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/18/07.

	#import "NCNode.h"
	#import "NCPostfix.h"
		
		
	@interface NCUnary : NCNode {
		NCPrimary *primary ;
		NCPostfix *postfix ;
		int vectorComponent ;
	}
	
	- (NCObject*)symbol ;

	@end

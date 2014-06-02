//
//  NCPostfix.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/18/07.
//

	#import "NCNode.h"
	#import "NCPrimary.h"

	@interface NCPostfix : NCNode {
		NCPrimary *primary ;
		NCPrimary *member ;
		//  function calls
		NSMutableArray *arguments ;			//  array of expressions
		//	arrays
		NCExpression *arrayIndex ;
		NCObject *nsObject ;
	}
	
	@end

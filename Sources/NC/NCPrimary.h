//
//  NCPrimary.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/17/07.

	#import "NCNode.h"
	#import "NCExpression.h"

	@interface NCPrimary : NCNode {
		NCExpression *expression ;			// non-nil for ( expression )
		NCObject *ncObject ;
		int intVal ;
		double realVal ;
		char *stringVal ;
	}
	
	- (NCValue*)incrementValue:(RuntimeStack*)inStack ;
	- (NCValue*)decrementValue:(RuntimeStack*)inStack ;
	
	@end

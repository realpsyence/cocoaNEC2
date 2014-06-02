//
//  NCCompound.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/14/07.


	#import "NCNode.h"
	#import "NCFunction.h"
	#import "NCStatement.h"

	@interface NCCompound : NCNode {
		NSMutableArray *statementList ;
		NSMutableArray *localVariables ;
	}

	- (NCStatement*)lastOp ;
	- (NSArray*)localVariables ;		//  v0.76
	
	@end

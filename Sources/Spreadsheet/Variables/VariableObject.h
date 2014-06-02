//
//  VariableObject.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/4/07.

#import <Cocoa/Cocoa.h>
#import "Primary.h"

@interface VariableObject : NSObject {
	NSString *name, *value, *comment ;
	NSMutableDictionary *plist ;
	Primary *primary ;
}

- (NSString*)name ;
- (void)setName:(NSString*)name ;
- (NSString*)value ;
- (void)setValue:(NSString*)name ;
- (NSString*)comment ;
- (void)setComment:(NSString*)name ;

- (Primary*)primaryValue ;

- (Boolean)empty ;

- (NSMutableDictionary*)makeVariable ;
- (void)releaseVariable ;
- (void)restoreVariable:(NSDictionary*)dict ;

@end

//
//  RecentFile.h
//  cocoaNEC
//
//  Created by Kok Chen on 8/19/07.

#import <Cocoa/Cocoa.h>


	@interface RecentFile : NSObject {
		IBOutlet id recentMenu ;

		NSMutableArray *recentPaths ;
		NSString *plistKey ;
	}

	- (void)performOpen:(NSString*)path ;
	- (void)touchedPath:(NSString*)path ;
	
	- (void)updatePrefsFromDict:(NSDictionary*)dict ;
	- (void)savePrefsToPlist:(NSMutableDictionary*)plist ;

	@end

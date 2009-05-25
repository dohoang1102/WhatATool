#import <Foundation/Foundation.h>
#import "PolygonShape.h"

void PrintPathInfo() {
	NSLog(@"Section 1: PrintPathInfo");
	NSLog(@"------------------------");

	NSArray *componentArray = nil;
	NSString *path = @"~";

	path = [path stringByExpandingTildeInPath];
	NSLog(@"My home folder is at %@", path);
	
	componentArray = [path pathComponents];
	NSLog(@"My path split into its components..");
	for (id component in componentArray) {
		NSLog(component);
	}
	
	NSLog(@" ");
}

void PrintProcessInfo() {
	NSLog(@"Section 2: PrintProcessInfo");
	NSLog(@"---------------------------");
	
	NSString *procName = [[NSProcessInfo processInfo] processName];
	int procId = [[NSProcessInfo processInfo] processIdentifier];
	NSLog(@"Process Name: %@, Process Id: %d", procName, procId);

	NSLog(@" ");
}

void PrintBookmarkInfo() {
	NSLog(@"Section 3: PrintBookmarkInfo");
	NSLog(@"----------------------------");
	
	NSMutableDictionary *urlDictionary = nil;
	urlDictionary = [[NSMutableDictionary alloc] initWithCapacity:5];

	/*
	Key (NSString) Value (NSURL) 
	Stanford University http://www.stanford.edu 
	Apple http://www.apple.com 
	CS193P http://cs193p.stanford.edu 
	Stanford on iTunes U http://itunes.stanford.edu 
	Stanford Mall http://stanfordshop.com 
	*/
	[urlDictionary setObject:@"http://www.stanford.edu" forKey:@"Stanford University"];
	[urlDictionary setObject:@"http://www.apple.com" forKey:@"Apple"];
	[urlDictionary setObject:@"http://www.cs193p.stanford.edu" forKey:@"CS193P"];
	[urlDictionary setObject:@"http://www.itunes.stanford.edu" forKey:@"Stanford on iTunes U"];
	[urlDictionary setObject:@"http://www.stanfordshop.com" forKey:@"Stanford Mall"];
	
	NSRange keyRange;
	for (id key in urlDictionary) {
		keyRange = [key rangeOfString:@"Stanford"];
		if (keyRange.location == 0)
			NSLog(@"Key: %@, URL: %@", key, [urlDictionary valueForKey:key]);
	}
	
	[urlDictionary release];
	NSLog(@" ");
}

void PrintIntrospectionInfo() {
	NSLog(@"Section 4: PrintIntrospectionInfo");
	NSLog(@"---------------------------------");

	NSLog(@" ");
}

void PrintPolygonInfo() {
	NSLog(@"Section 6: PrintIntrospectionInfo");
	NSLog(@"---------------------------------");

	NSMutableArray *a = [[NSMutableArray alloc]initWithCapacity:3];
	PolygonShape *s = nil;
	
	s = [[PolygonShape alloc] init];
	[s setMaximumNumberOfSides:7];
	[s setNumberOfSides:4];
	[s setMinimumNumberOfSides:3];
	[a addObject:s];

	s = [[PolygonShape alloc] initWithNumberOfSides:6 minimumNumberOfSides:5 maximumNumberOfSides:9];
	[a addObject:s];

	s = [[PolygonShape alloc] initWithNumberOfSides:12 minimumNumberOfSides:9 maximumNumberOfSides:13];
	[a addObject:s];
	s = nil;
	
	for (id shape in a) {
		[shape description];
		[shape release];
	}
	 
	[a release];
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	PrintPathInfo();
	PrintProcessInfo();
	PrintBookmarkInfo();
	PrintIntrospectionInfo();
	PrintPolygonInfo();
	
    [pool drain];
    return 0;
}

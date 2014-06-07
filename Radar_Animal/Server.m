//
//  Server.m
//  Radar_Animal
//
//  Created by Guilherme Andrade on 6/7/14.
//  Copyright (c) 2014 Guilherme Andrade. All rights reserved.
//

#import "Server.h"

@implementation Server

- (NSArray*)newsFeeds{
	if (!_newsFeeds) {
		NSString *newsFeedsJsonPath = [[NSBundle mainBundle] pathForResource:@"newsfeeds" ofType:@"json"];
		NSData *jsonData = [NSData dataWithContentsOfFile:newsFeedsJsonPath];
		
		NSError *error;
		NSDictionary *newsFeedsDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
		if (error) {
			NSLog(@"%@",error);
			return nil;
		}
		else{
			_newsFeeds = [newsFeedsDict objectForKey:@"NewsFeeds"];
		}
	}
	return _newsFeeds;
}

@end
//
//  LMLibrary.m
//  LMLibrary
//
//  Created by Liu Wanwei on 12-10-10.
//  Copyright (c) 2012年 Liu&Mao. All rights reserved.
//

#import "LMLibrary.h"

static LMLibrary * sDefaultManager = nil;

@implementation LMLibrary

+ (LMLibrary *)defaultManager {
    if (sDefaultManager == nil) {
        sDefaultManager = [[LMLibrary alloc] init];
    }
    
    return sDefaultManager;
}

- (void)postNotificationWithName:(NSString *)name withObject:(id)object {
    NSNotification * notification = nil;
    notification = [NSNotification notificationWithName:name object:object];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end

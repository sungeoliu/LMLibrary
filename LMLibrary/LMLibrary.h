//
//  LMLibrary.h
//  LMLibrary
//
//  Created by Liu Wanwei on 12-10-10.
//  Copyright (c) 2012年 Liu&Mao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseManager.h"
#import "DocumentManager.h"

#define AppString(key)          NSLocalizedString(key, nil)
#define CustomString(key, file) NSLocalizedStringFromTable(key, file, nil)

#define RGBRatio(x)             ((CGFloat)x / 255)
#define RGBColor(r, g, b)       [UIColor colorWithRed:RGBRatio(r) green:RGBRatio(g) blue:RGBRatio(b) alpha:1.0]


@interface LMLibrary : NSObject

+ (LMLibrary *)defaultManager;

- (void)postNotificationWithName:(NSString *)name withObject:(id)object;

@end

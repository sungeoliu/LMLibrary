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

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


@interface LMLibrary : NSObject

@end

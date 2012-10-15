//
//  DocumentManager.h
//  LMLibrary
//
//  Created by Liu Wanwei on 12-10-15.
//  Copyright (c) 2012年 Liu&Mao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DocumentManager : NSObject

+ (DocumentManager *)defaultManager;

- (NSURL *)pathForRandomImageWithSuffix:(NSString *)suffix;
- (NSURL *)pathForRandomSoundWithSuffix:(NSString *)suffix;

- (BOOL)saveImage:(UIImage *)image toURL:(NSURL *)url;

@end

//
//  DocumentManager.h
//  LMLibrary
//
//  Created by Liu Wanwei on 12-10-15.
//  Copyright (c) 2012年 Liu&Mao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define DefaultImageExtension               @"png"
#define DefaultVideoExtension               @"mp4"
#define DefaultSoundExtension               @"m4a"

@interface DocumentManager : NSObject

+ (DocumentManager *)defaultManager;

- (NSURL *)pathForRandomImageWithSuffix:(NSString *)suffix;
- (NSURL *)pathForRandomSoundWithSuffix:(NSString *)suffix;
- (NSURL *)pathForRandomVideoWithSuffix:(NSString *)suffix;

// TODO 测试用图片目录里的文件测试图片上传，所以需要生成文件路径。
- (NSString *)imagePath;

- (NSString *)soundPath;

- (BOOL)saveImage:(UIImage *)image toURL:(NSURL *)url;

@end

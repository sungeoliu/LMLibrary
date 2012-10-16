//
//  DocumentManager.m
//  LMLibrary
//
//  Created by Liu Wanwei on 12-10-15.
//  Copyright (c) 2012年 Liu&Mao. All rights reserved.
//

#import "DocumentManager.h"

static DocumentManager * sDefaultManager = nil;

@implementation DocumentManager

+ (DocumentManager *)defaultManager{
    if (sDefaultManager == nil) {
        sDefaultManager = [[DocumentManager alloc] init];
    }
    
    return sDefaultManager;
}

- (NSString *)documentDirectory{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

- (NSString *)imagePath{
    NSString * rootDirectory = [self documentDirectory];
    return [rootDirectory stringByAppendingPathComponent:@"image"];
}

- (NSString *)soundPath{
    NSString * rootDirectory = [self documentDirectory];
    return [rootDirectory stringByAppendingPathComponent:@"sound"];
}

- (BOOL)createPathIfNotExist:(NSString *)path{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]) {
        NSError * error = nil;
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:&error];
        if ([fileManager fileExistsAtPath:path]) {
            return NO;
        }
    }
    
    return YES;
}

- (NSString *)timeStringWithSuffix:(NSString *)suffix{
    time_t now = time(NULL);
    return [NSString stringWithFormat:@"%ld.%@", now, suffix];
}

- (NSURL *)pathForRandomImageWithSuffix:(NSString *)suffix{
    NSString * imagePath = [self imagePath];
    if (![self createPathIfNotExist:imagePath]) {
        return nil;
    }else{
        NSString * filename = [self timeStringWithSuffix:suffix];
        NSString * filePath = [imagePath stringByAppendingPathComponent:filename];
        
        // 文件系统中的路径"/usr/liuwanwei/..."经过fileURLWithPath转换后，
        // 变成“file://usr/liuwanwei/...”形式。
        // 要想返回字符串：NSString * stringFormat =  [xxx absoluteString];
        // 要想转换回URL类型：NSURL * url = [NSURL URLWithString:stringFormat];
        return [NSURL fileURLWithPath:filePath isDirectory:NO];
    }
}

- (NSURL *)pathForRandomSoundWithSuffix:(NSString *)suffix{
    NSString * soundPath = [self soundPath];
    if (![self createPathIfNotExist:soundPath]) {
        return nil;
    }else{
        NSString * filename = [self timeStringWithSuffix:suffix];
        NSString * filePath = [soundPath stringByAppendingPathComponent:filename];
        return [NSURL fileURLWithPath:filePath isDirectory:NO];
    }
}

- (BOOL)saveImage:(UIImage *)image toURL:(NSURL *)url{
    if (image == nil || url == nil) {
        return NO;
    }
    
    NSData * data = UIImagePNGRepresentation(image);
    [data writeToURL:url atomically:YES];
    return YES;
}

@end

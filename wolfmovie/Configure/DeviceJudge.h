//
//  DeviceJudge.h
//  wolfmovie
//
//  Created by WangChen on 2017/12/28.
//  Copyright © 2017年 ChenWang. All rights reserved.
//

/*
 设备相关的一些宏定义写在这个文件里面
 */
#ifndef DeviceJudge_h
#define DeviceJudge_h

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif



//设备型号
#define IS_IPAD                 [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad
#define IS_IPHONE               [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define IS_IPHONE_4             (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )480) < DBL_EPSILON )
#define IS_IPHONE_5             (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )568) < DBL_EPSILON )
#define IS_IPHONE_6_7_8         (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )667) < DBL_EPSILON )
#define IS_IPHONE_6_7_8_PLUS    (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )960) < DBL_EPSILON )
//#define IS_IPHONE_X (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )960) < DBL_EPSILON )


//系统版本
#define IS_IOS_VERSION  floorf([[UIDevice currentDevice].systemVersion floatValue])
#define IS_IOS_5    floorf([[UIDevice currentDevice].systemVersion floatValue]) == 5.0  ? 1 : 0
#define IS_IOS_6    floorf([[UIDevice currentDevice].systemVersion floatValue]) == 6.0  ? 1 : 0
#define IS_IOS_7    floorf([[UIDevice currentDevice].systemVersion floatValue]) == 7.0  ? 1 : 0
#define IS_IOS_8    floorf([[UIDevice currentDevice].systemVersion floatValue]) == 8.0  ? 1 : 0
#define IS_IOS_9    floorf([[UIDevice currentDevice].systemVersion floatValue]) == 9.0  ? 1 : 0
#define IS_IOS_10   floorf([[UIDevice currentDevice].systemVersion floatValue]) == 10.0 ? 1 : 0
#define IS_IOS_11   floorf([[UIDevice currentDevice].systemVersion floatValue]) == 11.0 ? 1 : 0


//自定义的NSLog
#ifdef DEBUG
#define XSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#define YYLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else

#define XSLog(FORMAT, ...) nil;
#define YYLog(FORMAT, ...) nil;
#endif

#define IS_VALID_DICTIONARY(dictionary) (dictionary && [dictionary isKindOfClass:[NSDictionary class]] && [dictionary count])
#define IS_VALID_ARRAY(array) (array && [array isKindOfClass:[NSArray class]] && [array count])
#define IS_VALID_STRING(string) (string && [string isKindOfClass:[NSString class]] && [string length])
#define STRING_VALUE(string)    [NSString stringWithFormat:@"%@",string]


#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define kCachesDirectoryPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define kStandardUserDefaults [NSUserDefaults standardUserDefaults]
#endif /* DeviceJudge_h */

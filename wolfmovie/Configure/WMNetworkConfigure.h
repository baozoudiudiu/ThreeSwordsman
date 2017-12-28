//
//  TPTNetworkConfigure.h
//  taopaitang
//
//  Created by chenwang on 2017/10/26.
//  Copyright © 2017年 refineit. All rights reserved.
//

/*
 和网络请求相关的配置写在该文件中
 */


#ifndef WMNetworkConfigure_h
#define WMNetworkConfigure_h

#define kStatusKey              @"STATUS"///<请求服务器返回状态码
#define kResultKey              @"result"///<请求服务器返回的数据

typedef NS_ENUM(NSUInteger, TPTResultCode) {
    TPTResultCodeUnknow,
    TPTResultCodeSuccess = 1001
};

#import "TPTNetRequest.h"
// 测试服务器地址
// #define kBaseNetworkPath @"http://116.236.146.200:8687"
#define kBaseNetworkPath @"http://27.115.34.222:8687"
// 正式服务器地址
// #define KBaseNetworkPath @"https://{正式接口路径}?token=xxx"

#define kBaseImagePath @"http://cdn1.taopaitang.com/"
#define kBaseGetImagePath @"http://m.taopaitang.com/taopaitang/data/upload/shop/class/"

#endif /* WMNetworkConfigure_h */

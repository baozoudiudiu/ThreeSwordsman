//
//  AppDelegate.h
//  wolfmovie
//
//  Created by WangChen on 2017/12/28.
//  Copyright © 2017年 ChenWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WM_AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

/**
 获取appDelegate

 @return WM_AppDelegate
 */
static inline WM_AppDelegate *GetAppDelegate() {
    UIApplication *application = [UIApplication sharedApplication];
    return (WM_AppDelegate *)(application.delegate);
}

/**
 获取UIApplication

 @return UIApplication
 */
static inline UIApplication *SharedApplication() {
    return [UIApplication sharedApplication];
}

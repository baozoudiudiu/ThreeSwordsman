//
//  UIConfigure.h
//  taopaitang
//
//  Created by chenwang on 2017/10/26.
//  Copyright © 2017年 refineit. All rights reserved.
//

/*
 和UI想关的一些宏定义写在这个文件中
 比如颜色,字体,等等
 */

#ifndef UIConfigure_h
#define UIConfigure_h
// 获取RGB颜色
#define kRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define kRGB(r,g,b) kRGBA(r,g,b,1.0f)
#define kHEXCOLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]

// 下方tabBar按钮选中字体颜色
#define kTabBarUnSelectedColor [UIColor colorWithRed:0.32 green:0.32 blue:0.32 alpha:1.00]
#define kTabBarSelectedColor kRGBA(255,141,51,1)

//导航栏背景色
#define kNavigationBarBgColor kRGBA(53,49,52,1)

//通用灰白背景色
#define kCommonBgColor kRGBA(240,240,240,1)

//首页item标题字体颜色
#define kHomePageItemTitleColor kRGBA(54,50,50,1)
//首页item标题字号
#define kHomePageItemTitleFont 14

#define kDefaultPinkColor [UIColor colorWithRed:1.00 green:0.40 blue:0.31 alpha:1.00]
#define kDefaultYellowColor [UIColor colorWithRed:0.96 green:0.85 blue:0.00 alpha:1.00]
#define kDefaultRedColor kHEXCOLOR(0xd11f1f)
#define kLightOrangeColor kHEXCOLOR(0xdfae84)
#define kLightGrayColor [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:1.00]
#define kLightGrayBorderColor [UIColor colorWithRed:0.86 green:0.86 blue:0.87 alpha:1.00]

//物理屏幕尺寸
#define kDEVICE_HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define kDEVICE_WIDTH     [[UIScreen mainScreen] bounds].size.width

//按iphone6(4.7寸)比例调
#define kScaleSize(kSize)   ([UIScreen mainScreen].bounds.size.width * (kSize) / 375)


#define kIsiPhoneX (kDEVICE_WIDTH == 375.f && kDEVICE_HEIGHT == 812.f ? YES : NO)
#define kSystemStatusBarHeight (kIsiPhoneX ? 44.f : 20.f)
#define kSystemNavBarHeight (kIsiPhoneX ? 88.f : 64.f)
#define kSystemTabbarHeight (kIsiPhoneX ? 83.f : 49.f)

#endif /* UIConfigure_h */

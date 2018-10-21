//
//  TJCommonDefines.h
//  TJCommonKit
//
//  Created by tao on 2018/10/19.
//  Copyright © 2018年 tao. All rights reserved.
//

#ifndef TJCommonDefines_h
#define TJCommonDefines_h

#pragma mark - 变量-设备相关
// 设备类型
#define IS_IPAD [QMUIHelper isIPad]
#define IS_IPAD_PRO [QMUIHelper isIPadPro]
#define IS_IPOD [QMUIHelper isIPod]
#define IS_IPHONE [QMUIHelper isIPhone]
#define IS_SIMULATOR [QMUIHelper isSimulator]

// 操作系统版本号，只获取第二级的版本号，例如 10.3.1 只会得到 10.3
#define IOS_VERSION ([[[UIDevice currentDevice] systemVersion] doubleValue])

// 数字形式的操作系统版本号，可直接用于大小比较；如 110205 代表 11.2.5 版本；根据 iOS 规范，版本号最多可能有3位
#define IOS_VERSION_NUMBER [QMUIHelper numbericOSVersion]

// 是否横竖屏
// 用户界面横屏了才会返回YES
#define IS_LANDSCAPE UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])
// 无论支不支持横屏，只要设备横屏了，就会返回YES
#define IS_DEVICE_LANDSCAPE UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])

// 屏幕宽度，会根据横竖屏的变化而变化
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

// 屏幕宽度，跟横竖屏无关
#define DEVICE_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

// 屏幕高度，会根据横竖屏的变化而变化
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

// 屏幕高度，跟横竖屏无关
#define DEVICE_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#endif /* TJCommonDefines_h */

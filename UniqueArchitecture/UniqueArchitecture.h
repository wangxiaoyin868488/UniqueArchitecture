//
//  UniqueArchitecture.h
//  UniqueArchitecture
//
//  Created by summer on 15/5/10.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#ifndef UniqueArchitecture_UniqueArchitecture_h
#define UniqueArchitecture_UniqueArchitecture_h

// 根据屏幕缩放比例，将像素转换成点
#define POINTS_FROM_PIXELS(__PIXELS) (__PIXELS / [[UIScreen mainScreen] scale])
#define ONE_PIXEL POINTS_FROM_PIXELS(1.0)

// Screen Size
//#define SCREEN_WIDTH					320
#define SCREEN_WIDTH                    CGRectGetWidth([[UIScreen mainScreen] bounds])
#define SCREEN_HEIGHT                   CGRectGetHeight([[UIScreen mainScreen] bounds])
#define TAB_BAR_HEIGHT					50
#define SEARCH_BAR_HEIGHT				44
#define NAVIGATION_BAR_HEIGHT           44
#define KEYBOARD_HEIGHT					260.0
#define KStatusBarHeight		    	20.0
#define SCREEN_SCALE                    SCREEN_WIDTH/320.f

//fengdong给宏加上括号，否则x为表达式时会错误扩展
#define kScaleNum(x)                    ((x)*SCREEN_SCALE)         //以iphone5s设计稿来计算适配其他屏幕的高度  //JB sheji
#define kIphone6Scale(x)                ((x)*SCREEN_WIDTH/375.0f) //以iphone6设计稿来计算适配其他屏幕的高度
#define kIphone6PlusScale(x)            ((x)*SCREEN_WIDTH/414.0f) //以iphone6plus设计稿来计算适配其他屏幕的高度


// 7.0以上系统，nav bar 64象素
#define EXTENDED_LAYOUT_TOP_OFFSET           (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) ? 64 : 0.0)

// 2.0以上系统为64,以下为0
#define JD_TOP_OFFSET                   (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) ? 64 : 0)


#endif

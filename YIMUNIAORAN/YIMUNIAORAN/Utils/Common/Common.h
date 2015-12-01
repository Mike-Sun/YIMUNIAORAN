//
//  Common.h
//  SAYOGI
//
//  Created by  莲藕科技 on 15/10/31.
//  Copyright © 2015年  莲藕科技. All rights reserved.
//

#ifndef Common_h
#define Common_h

#define APIKEY @"836d0c4ab3"

// Library路径
#define LIBRARY_PATH [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject]

/****************************尺寸信息****************************/
#define SCREEN_FRAME ([UIScreen mainScreen].applicationFrame)
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


/****************************颜色列表****************************/
// tabBar/navBar背景色
#define TABBAR_GRAY ([UIColor colorWithRed:67 / 255.0 green:70 / 255.0 blue:77 / 255.0 alpha:1])
// tabBar未选中字体
#define TABBARTEXT_GRAY ([UIColor colorWithRed:170 / 255.0 green:170 / 255.0 blue:170 / 255.0 alpha:1])
// 所有VC背景色
#define VCBACKGROUND_GRAY ([UIColor colorWithRed:213 / 255.0 green:217 / 255.0 blue:220 / 255.0 alpha:1])
// 九宫格分割线颜色
#define GRIDSEPARTOR_GRAY ([UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1])
// pageControl未选中颜色
#define PAGECONTROL_GRAY ([UIColor colorWithRed:220 / 255.0 green:220 / 255.0 blue:220 / 255.0 alpha:1])

/****************************图片路径头****************************/
#define PICPATHHEAD @"http://sayoogi.oss-cn-hangzhou.aliyuncs.com/"

#endif /* Common_h */

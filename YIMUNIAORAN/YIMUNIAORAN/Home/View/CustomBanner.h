//
//  CustomBanner.h
//  YIMUNIAORAN
//
//  Created by Michael Sun (莲藕科技) on 15/11/27.
//  Copyright © 2015年 Michael Sun. All rights reserved.
//

/**
 *  首页轮播区View
 *
 */

#import <UIKit/UIKit.h>


@protocol CustomBannerDelegate <NSObject>

- (void)selectedScrollDict:(NSDictionary *)selectedDict;

@end

@interface CustomBanner : UIView

@property(nonatomic, assign) id<CustomBannerDelegate>delegate;

- (void)setImagesWithArray:(NSMutableArray *)infoArr;
- (void)startTimer;
- (void)stopTimer;
@end
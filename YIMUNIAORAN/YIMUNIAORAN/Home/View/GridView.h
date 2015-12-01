//
//  GridView.h
//  YIMUNIAORAN
//
//  Created by Michael Sun (莲藕科技) on 15/11/30.
//  Copyright © 2015年 Michael Sun. All rights reserved.
//

/**
 *  首页九宫格View
 *
 */

#import <UIKit/UIKit.h>

@protocol GridViewDelegate <NSObject>

- (void)gridViewDidClickAtIndex:(NSInteger)index;

@end

@interface GridView : UIView

@property (nonatomic, strong) id<GridViewDelegate> delegate;

@end

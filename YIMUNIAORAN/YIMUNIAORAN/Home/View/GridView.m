//
//  GridView.m
//  YIMUNIAORAN
//
//  Created by Michael Sun (莲藕科技) on 15/11/30.
//  Copyright © 2015年 Michael Sun. All rights reserved.
//

#import "GridView.h"

@implementation GridView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = VCBACKGROUND_GRAY;
        
        [self createInterfaceWithFrame:frame];
        
    }
    
    return self;
}

/**
 *  创建视图
 *
 */
- (void)createInterfaceWithFrame:(CGRect)frame {
    
    for (int i = 0; i < 9; i ++) {
        // x坐标: i % 3
        // y坐标: i / 3
        UIImageView *gridImg = [[UIImageView alloc] initWithFrame:CGRectMake((i % 3) * CGRectGetWidth(frame) / 3,
                                                                             (i / 3) * CGRectGetHeight(frame) / 3,
                                                                             CGRectGetWidth(frame) / 3,
                                                                             CGRectGetHeight(frame) / 3)];
        gridImg.tag = i;
        gridImg.backgroundColor = [UIColor whiteColor];
        gridImg.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gridViewTapped:)];
        [gridImg addGestureRecognizer:tapGesture];
        [self addSubview:gridImg];
        
    }
    
    UIView *vLineA = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) / 3,
                                                              10,
                                                              1,
                                                              CGRectGetHeight(frame) - 20)];
    vLineA.backgroundColor = GRIDSEPARTOR_GRAY;
    [self addSubview:vLineA];
    
    UIView *vLineB = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) / 3 * 2,
                                                              10,
                                                              1,
                                                              CGRectGetHeight(frame) - 20)];
    vLineB.backgroundColor = GRIDSEPARTOR_GRAY;
    [self addSubview:vLineB];
    
    UIView *hLineA = [[UIView alloc] initWithFrame:CGRectMake(10,
                                                              CGRectGetHeight(frame) / 3,
                                                              CGRectGetWidth(frame) - 20,
                                                              1)];
    hLineA.backgroundColor = GRIDSEPARTOR_GRAY;
    [self addSubview:hLineA];
    
    UIView *hLineB = [[UIView alloc] initWithFrame:CGRectMake(10,
                                                              CGRectGetHeight(frame) / 3 * 2,
                                                              CGRectGetWidth(frame) - 20,
                                                              1)];
    hLineB.backgroundColor = GRIDSEPARTOR_GRAY;
    [self addSubview:hLineB];
}

/**
 *  九宫格点击事件
 *
 */
- (void)gridViewTapped:(UITapGestureRecognizer *)tapGesture {
    NSInteger viewTag = tapGesture.view.tag;
    
    [self.delegate gridViewDidClickAtIndex:viewTag];
    
}








@end

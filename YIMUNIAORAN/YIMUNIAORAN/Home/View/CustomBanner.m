//
//  CustomBanner.m
//  YIMUNIAORAN
//
//  Created by Michael Sun (莲藕科技) on 15/11/27.
//  Copyright © 2015年 Michael Sun. All rights reserved.
//

#import "CustomBanner.h"
#import "UIImageView+WebCache.h"

@interface CustomBanner ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray       *infoArr;       // 存储字典信息的数组
@property (nonatomic, strong) UIScrollView  *imageScroll;   // 不需要给外界提供的在延展里设为属性
@property (nonatomic, assign) NSInteger      currentPage;   // 当前页
@property (nonatomic, assign) NSInteger      totalPage;     // 总页数
@property (nonatomic, strong) UIPageControl *pageControl;   // pageControl
@property (nonatomic, strong) NSTimer       *scrollTimer;   // 滚动计时器

@end

@implementation CustomBanner

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.currentPage = 1;
        self.imageScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0,
                                                                          0,
                                                                          CGRectGetWidth(frame),
                                                                          CGRectGetHeight(frame))];
        self.imageScroll.delegate = self;
        self.imageScroll.bounces = NO;        // 边框回弹取消
        self.imageScroll.pagingEnabled = YES; // 整页滚动
        self.imageScroll.showsHorizontalScrollIndicator = NO;
        self.imageScroll.showsVerticalScrollIndicator = NO;
        [self addSubview:self.imageScroll];
        
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0,
                                                                           CGRectGetHeight(frame) - 20,
                                                                           SCREEN_WIDTH,
                                                                           20)];
        self.pageControl.pageIndicatorTintColor = PAGECONTROL_GRAY;
        [self addSubview:self.pageControl];
    }
    
    return self;
}

#pragma mark - 设置scrollView上的图片
- (void)setImagesWithArray:(NSMutableArray *)infoArr{
    self.pageControl.numberOfPages = infoArr.count;
    
    NSDictionary *lastDict = [infoArr lastObject];
    NSDictionary *firstDict = [infoArr firstObject];
    [infoArr insertObject:lastDict atIndex:0];
    [infoArr addObject:firstDict];
    
    self.infoArr = infoArr;
    
    [self.imageScroll setContentSize:CGSizeMake(self.imageScroll.frame.size.width * infoArr.count, 0)];
    self.totalPage = self.imageScroll.contentSize.width / self.imageScroll.frame.size.width;
    NSLog(@"轮播区总页数 == %ld", self.totalPage);
    int i = 0;
    for (NSMutableDictionary *infoDict in infoArr) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.imageScroll.frame.size.width * i,
                                                                               0,
                                                                               self.imageScroll.frame.size.width,
                                                                               self.imageScroll.frame.size.height)];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:[infoDict objectForKey:@"imgUrl"]]];
        [self.imageScroll addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [imageView addGestureRecognizer:tap];
        i++;
    }
    [self.imageScroll setContentOffset:CGPointMake(self.imageScroll.frame.size.width, 0)];
}

#pragma mark - 开始计时器
- (void)startTimer {
    self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}

#pragma mark - 停止计时器
- (void)stopTimer {
    [self.scrollTimer invalidate];
}

#pragma mark - 计时器事件
- (void)timerAction:(NSTimer *)timer{
    self.currentPage++;
    [UIView animateWithDuration:0.5 animations:^{
        [self.imageScroll setContentOffset:CGPointMake(CGRectGetWidth(self.imageScroll.frame) * self.currentPage, 0)];
    } completion:^(BOOL finished) {
        if (self.currentPage == self.totalPage - 1) {
            [self.imageScroll setContentOffset:CGPointMake(CGRectGetWidth(self.imageScroll.frame), 0)];
            self.currentPage = 1;
        }
        self.pageControl.currentPage = self.currentPage - 1;
    }];
}

#pragma mark - scrollView停止减速事件
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.currentPage = self.imageScroll.contentOffset.x / CGRectGetWidth(self.imageScroll.frame);
    
    if (self.currentPage == 0) {
        [self.imageScroll setContentOffset:CGPointMake(self.imageScroll.contentSize.width - CGRectGetWidth(self.imageScroll.frame) * 2, 0)];
        self.currentPage = self.totalPage - 2;
    }else if (self.currentPage == self.totalPage - 1) {
        [self.imageScroll setContentOffset:CGPointMake(CGRectGetWidth(self.imageScroll.frame), 0)];
        self.currentPage = 1;
    }
    self.pageControl.currentPage = self.currentPage - 1;
}

#pragma mark - 图片点击事件
- (void)tapAction:(UITapGestureRecognizer *)tapGesture{
    
    NSLog(@"tap index = %ld", tapGesture.view.tag);
    [self.delegate selectedScrollDict:[self.infoArr objectAtIndex:tapGesture.view.tag]];
}

@end

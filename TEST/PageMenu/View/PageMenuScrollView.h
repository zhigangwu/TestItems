//
//  PageMenuScrollView.h
//  TEST
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ScrollViewContentOffsetDelegate <NSObject>

- (void)contentOffset:(CGFloat)x;

@end

@interface PageMenuScrollView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) id<ScrollViewContentOffsetDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

//
//  PageMenuScrollView.m
//  TEST
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "PageMenuScrollView.h"
#import "Masonry.h"

@interface PageMenuScrollView () <UIScrollViewDelegate>
{
    CGFloat contentOffset_X;
}

@end

@implementation PageMenuScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _scrollView = [UIScrollView new];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.backgroundColor = UIColor.yellowColor;
        [self addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self);
        }];
    }
    return self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    contentOffset_X = 0;
    contentOffset_X = scrollView.contentOffset.x;

    
    if ([self respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
        [self.delegate contentOffset:contentOffset_X];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

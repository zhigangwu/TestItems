//
//  AnimationButton.m
//  TEST
//
//  Created by apple on 2019/2/25.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "AnimationButton.h"
#import "AnimationView.h"

@interface AnimationButton ()

@property (nonatomic, strong) AnimationView *animationView;

@end

@implementation AnimationButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.clipsToBounds = NO;
    _animationView = [[AnimationView alloc] init];
    [self insertSubview:_animationView atIndex:0];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.animationView.frame = self.bounds;
    [self insertSubview:self.animationView atIndex:0];
}

- (void)animate {
    [self.animationView animate];
}


// 弹出
- (void)popOutsideWithDuration:(NSTimeInterval)duration {
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 3.0 animations:^{
            self.transform = CGAffineTransformMakeScale(2.0f, 2.0f); // 放大
        }];
        [UIView addKeyframeWithRelativeStartTime:1 / 3.0 relativeDuration:1/ 3.0 animations:^{
            self.transform = CGAffineTransformMakeScale(0.8f, 0.8f); // 缩小
        }];
        [UIView addKeyframeWithRelativeStartTime:2/ 3.0 relativeDuration:1/ 3.0 animations:^{
            self.transform = CGAffineTransformMakeScale(1.0f, 1.0f); // 恢复
        }];
    } completion:nil];
}

// 弹进
- (void)popInsideWithDuration:(NSTimeInterval)duration {
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 2.0 animations:^{
            self.transform = CGAffineTransformMakeScale(0.7f, 0.7f);
        }];
        [UIView addKeyframeWithRelativeStartTime:1 / 2.0 relativeDuration:1 / 2.0 animations:^{
            self.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        }];
    } completion:nil];
}

// 获取粒子图像
- (UIImage *)particleImage {
    return self.animationView.particleImage;
}

// 设置粒子图像
- (void)setParticleImage:(UIImage *)particleImage {
    self.animationView.particleImage = particleImage;
}

// 获取缩放
- (CGFloat)paeticleScale {
    return self.animationView.particleScale;
}

// 设置缩放
- (void)setPaeticleScale:(CGFloat)paeticleScale {
    self.animationView.particleScale = paeticleScale;
}

// 获取缩放范围
- (CGFloat)particleScaleRange {
    return self.animationView.particleScaleRange;
}

// 设置缩放范围
- (void)setParticleScaleRange:(CGFloat)particleScaleRange {
    self.animationView.particleScaleRange = particleScaleRange;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

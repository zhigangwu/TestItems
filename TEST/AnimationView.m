//
//  AnimationView.m
//  TEST
//
//  Created by apple on 2019/2/25.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "AnimationView.h"

@interface AnimationView()

@property (nonatomic, strong) CAEmitterLayer *explosionLayer;
@property (nonatomic, strong) CAEmitterCell *explpsionCell;

@end

@implementation AnimationView

- (instancetype)initWithFrame:(CGRect)frame {
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
    self.clipsToBounds = NO; // 当它取值为 YES 时，剪裁超出父视图范围的子视图部分；当它取值为 NO 时，不剪裁子视图。
    
    //当前视图设为view.userInteractionEnabled=NO 时，当前视图不可交互，该视图上面的子视图也不可与用户交互（不可响应即被该视图忽视），响应事件传递到下面的父视图。当前视图设为view.userInteractionEnabled=YES 时，当前视图可交互，该视图上面的子视图可以用户交互（可以响应即被视图接受），下面的父视图不会接收到响应。
    self.userInteractionEnabled = NO;
    
    _explpsionCell = [CAEmitterCell emitterCell];
    _explpsionCell.name = @"explosion";
    _explpsionCell.alphaRange = 0.2f; // 透明度改变的范围
    _explpsionCell.alphaSpeed = -1.0f; // 透明度改变的速度
    _explpsionCell.lifetime = 0.7f; //粒子存活的时间,以秒为单位
    _explpsionCell.lifetimeRange = 0.3f; // 可以为这个粒子存活的时间再指定一个范围
    _explpsionCell.birthRate = 0.f; // 粒子产生系数
    _explpsionCell.velocity = 40.0f; // 粒子速度
    _explpsionCell.velocityRange = 10.0f; // 粒子速度范围
    
    _explosionLayer = [CAEmitterLayer layer];
    _explosionLayer.name = @"emitterLayer";
    _explosionLayer.emitterShape = kCAEmitterLayerCircle; // 发射形状
    _explosionLayer.emitterMode = kCAEmitterLayerOutline; //f发射模式 从发射器边缘发出
    _explosionLayer.emitterSize = CGSizeMake(25.f, 0.f); // 发射器的尺寸
    _explosionLayer.emitterCells = @[_explpsionCell];
    _explosionLayer.renderMode = kCAEmitterLayerOldestFirst; // 渲染模式
    _explosionLayer.masksToBounds = NO;
    [self.layer addSublayer:_explosionLayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    self.explosionLayer.emitterPosition = center;
}

- (void)animate {
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC);
    dispatch_after(delay, dispatch_get_main_queue(), ^{
        self.explosionLayer.beginTime = CACurrentMediaTime();
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"emitterCells.explosion.birthRate"];
        animation.fromValue = @0;
        animation.toValue = @500;
        [self.explosionLayer addAnimation:animation forKey:nil];
    });
}

- (void)setParticleImage:(UIImage *)particleImage {
    _particleImage = particleImage;
    self.explpsionCell.contents = (id)[particleImage CGImage];
}

- (void)setParticleScale:(CGFloat)particleScale {
    _particleScale = particleScale;
    self.explpsionCell.scale = particleScale;
}

- (void)setParticleScaleRange:(CGFloat)particleScaleRange {
    _particleScaleRange = particleScaleRange;
    self.explpsionCell.scaleRange = particleScaleRange;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

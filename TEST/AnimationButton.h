//
//  AnimationButton.h
//  TEST
//
//  Created by apple on 2019/2/25.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnimationButton : UIButton

@property (nonatomic, strong) UIImage *particleImage;
@property (nonatomic, assign) CGFloat paeticleScale;
@property (nonatomic, assign) CGFloat particleScaleRange;

- (void)animate;
- (void)popOutsideWithDuration:(NSTimeInterval)duration;
- (void)popInsideWithDuration:(NSTimeInterval)duration;


@end

NS_ASSUME_NONNULL_END

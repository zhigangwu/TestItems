//
//  AnimationView.h
//  TEST
//
//  Created by apple on 2019/2/25.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnimationView : UIView

@property (nonatomic, strong) UIImage *particleImage;
@property (nonatomic, assign) CGFloat particleScale;
@property (nonatomic, assign) CGFloat particleScaleRange;

- (void)animate;

@end

NS_ASSUME_NONNULL_END

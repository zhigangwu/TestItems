//
//  AnimationViewController.m
//  TEST
//
//  Created by apple on 2019/2/25.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "AnimationViewController.h"
#import "Masonry.h"
#import "AnimationButton.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ( [UIScreen mainScreen].bounds.size.height)

@interface AnimationViewController ()

@property (nonatomic, strong) AnimationButton *animationButton;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"动画";
    self.view.backgroundColor = UIColor.whiteColor;
    
//    self.animationButton.center = self.view.center;
    [self.view addSubview:self.animationButton];
    
    [self animationRedSquare];
    [self animationTextField];
}

- (AnimationButton *)animationButton {
    if (!_animationButton) {
        _animationButton = [[AnimationButton alloc] init];
        _animationButton.frame = CGRectMake(50.f, 100.f, 24.f, 24.f);
        _animationButton.particleImage = [UIImage imageNamed:@"礼花"];
        _animationButton.paeticleScale = 0.05f;
        _animationButton.particleScaleRange = 0.02f;
        [_animationButton addTarget:self action:@selector(praiseAction:) forControlEvents:UIControlEventTouchUpInside];
        [_animationButton setImage:[UIImage imageNamed:@"点赞 (1)"] forState:UIControlStateNormal];
        [_animationButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateSelected];
        
        // 心跳动画
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation.duration = 1.2; // 动画持续时间
        animation.repeatCount = 10000000; // 重复次数
        animation.autoreverses = YES; // 是否执行你动画
        animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
        animation.toValue = [NSNumber numberWithFloat:1.4]; // 结束时的倍率
        animation.removedOnCompletion = NO;
        [_animationButton.layer addAnimation:animation forKey:@"scale-layer"];
    }
    return _animationButton;
}

- (void)praiseAction:(AnimationButton *)button {
    if (button.selected) {
        [button popInsideWithDuration:0.4f];
    } else {
        [button popOutsideWithDuration:0.5f];
        [button animate];// 粒子效果
    }
    button.selected = !button.selected;
}

- (void)animationRedSquare{
    UIButton *loginbut = [[UIButton alloc] init];
    [loginbut.layer setCornerRadius:5];
    loginbut.layer.masksToBounds = true;
    loginbut.backgroundColor = UIColor.lightGrayColor;
    [loginbut setTitle:@"登录" forState:UIControlStateNormal];
    loginbut.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:loginbut];
    [loginbut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-80);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"]; //keyPath为系统提供
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(WIDTH / 2,100)]; // 动画的开始值
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(WIDTH / 2,HEIGHT - 95)]; // 动画结束值
    animation.duration = 3.0f; // 持续时间
    [loginbut.layer addAnimation:animation forKey:@"positionAnimation"];
    
    
}

- (void)animationTextField {
    UITextField *textfieldID = [[UITextField alloc] init];
    textfieldID.placeholder = @"请输入登入账号";
    [textfieldID.layer setCornerRadius:5];
    textfieldID.layer.masksToBounds = YES;
    [textfieldID.layer setBorderWidth:1];
    [textfieldID.layer setBorderColor:UIColor.grayColor.CGColor];
    [self.view addSubview:textfieldID];
    [textfieldID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(180, 30));
    }];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x - WIDTH, self.view.center.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y)];
    animation.duration = 3.0f;
    [textfieldID.layer addAnimation:animation forKey:@"positionAnimation"];
    
    UITextField *PWtextfield = [[UITextField alloc] init];
    PWtextfield.placeholder = @"请输入密码";
    [PWtextfield.layer setCornerRadius:5];
    PWtextfield.layer.masksToBounds = YES;
    [PWtextfield.layer setBorderWidth:1];
    [PWtextfield.layer setBorderColor:UIColor.grayColor.CGColor];
    [self.view addSubview:PWtextfield];
    [PWtextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view).offset(40);
        make.size.mas_equalTo(CGSizeMake(180, 30));
    }];
    
    CABasicAnimation *pwanimation = [CABasicAnimation animationWithKeyPath:@"position"];
    pwanimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x - WIDTH, self.view.center.y + 40)];
    pwanimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y + 40)];
    pwanimation.duration = 3.0f;
    [PWtextfield.layer addAnimation:pwanimation forKey:@"positionAnimation"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

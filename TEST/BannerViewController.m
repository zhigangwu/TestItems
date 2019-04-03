//
//  BannerViewController.m
//  TEST
//
//  Created by apple on 2019/2/28.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "BannerViewController.h"
#import "Masonry.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ( [UIScreen mainScreen].bounds.size.height)

@interface BannerViewController () <CAAnimationDelegate>
{
    UIScrollView *scrollView;
    
    UIButton *wukong;
    UIImageView *cloudImageV;
    
    UIButton *gfwufan;
    UIButton *qiqi;
    
    UIButton *sonwufan;
    UIButton *wutian;
}


@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"动画";
    self.view.backgroundColor = UIColor.whiteColor;
    
    scrollView = [[UIScrollView alloc] init];
    [scrollView setContentOffset:CGPointMake(WIDTH / 2, HEIGHT / 2) animated:YES];
    scrollView.bouncesZoom = NO;
    scrollView.backgroundColor = UIColor.yellowColor;
    scrollView.contentSize = CGSizeMake(WIDTH * 2, HEIGHT * 2);
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    
    [self initwukong];
    [self initgfwufan];
    [self initqiqi];
    [self initCloudImageV];
}

- (void)initwukong {
    wukong = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH - 30, HEIGHT - 30, 60, 60)];
    [wukong.layer setCornerRadius:30];
    wukong.layer.masksToBounds = true;
    [wukong setBackgroundImage:[UIImage imageNamed:@"悟空小时候.jpg"] forState:UIControlStateNormal];
    [scrollView addSubview:wukong];
    [wukong addTarget:self action:@selector(touchwukong:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchwukong:(UIButton *)sender {
#pragma mark wufan
    // 弧度路劲
    CAKeyframeAnimation *gfwufananima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(WIDTH + 120, HEIGHT)
                                                        radius:120
                                                    startAngle:3.1415926
                                                      endAngle:3.1415926 * 3 / 2
                                                     clockwise:YES];
    gfwufananima.path = path.CGPath;
    gfwufananima.duration = 2.0f;
    [gfwufan.layer addAnimation:gfwufananima forKey:@"pathAnimation"];
    
    // 缩放
    CABasicAnimation *gfwufanbaseanim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    gfwufanbaseanim.fromValue = [NSNumber numberWithFloat:0.2];
    gfwufanbaseanim.toValue = [NSNumber numberWithFloat:1.0f];
    gfwufanbaseanim.duration = 2.0f;
    [gfwufan.layer addAnimation:gfwufanbaseanim forKey:@"scaleAnimation"];
    
#pragma mark qiqi
    CAKeyframeAnimation *qiqianima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *qiqipath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(WIDTH, HEIGHT + 120)
                                                        radius:120
                                                    startAngle:3.1415926 * 3 / 2
                                                      endAngle:3.1415926 * 2
                                                     clockwise:YES];
    qiqianima.path = qiqipath.CGPath;
    qiqianima.duration = 2.0f;
    [qiqi.layer addAnimation:qiqianima forKey:@"pathAnimation"];
    
    CABasicAnimation *qiqibaseanim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    qiqibaseanim.fromValue = [NSNumber numberWithFloat:0.2];
    qiqibaseanim.toValue = [NSNumber numberWithFloat:1.0f];
    qiqibaseanim.duration = 2.0f;
    [qiqi.layer addAnimation:qiqibaseanim forKey:@"scaleAnimation"];
    
#pragma mark 筋斗云
    CABasicAnimation *jdyanim = [CABasicAnimation animationWithKeyPath:@"position"];
    jdyanim.fromValue = [NSValue valueWithCGPoint:CGPointMake(WIDTH, HEIGHT)];
    
    // 翻转
    CABasicAnimation *gfFlipAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    gfFlipAnim.toValue = [NSNumber numberWithFloat:M_PI];
    gfFlipAnim.duration = 2.0f;
    gfFlipAnim.cumulative = NO;
    gfFlipAnim.repeatCount = 1;
    gfFlipAnim.fillMode = kCAFillModeForwards;
    gfFlipAnim.removedOnCompletion = NO;
    gfFlipAnim.delegate = self;
    [wukong.layer addAnimation:gfFlipAnim forKey:@"rotationAnimation"];
    [self performSelector:@selector(changeBGImage) withObject:nil afterDelay:1.0f];
    
}

// 翻转后更换背景图
- (void)changeBGImage {
    [wukong setBackgroundImage:[UIImage imageNamed:@"悟空.jpg"] forState:UIControlStateNormal];
}


- (void)initgfwufan {
    gfwufan = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH + 90, HEIGHT - 150, 60, 60)];
    [gfwufan.layer setCornerRadius:30];
    gfwufan.layer.masksToBounds = true;
    [gfwufan setBackgroundImage:[UIImage imageNamed:@"孙悟饭爷爷.jpg"] forState:UIControlStateNormal];
    [scrollView addSubview:gfwufan];
}

- (void)initqiqi {
    qiqi = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH + 90, HEIGHT + 90, 60, 60)];
    [qiqi.layer setCornerRadius:30];
    qiqi.layer.masksToBounds = true;
    [qiqi setBackgroundImage:[UIImage imageNamed:@"琪琪.jpeg"] forState:UIControlStateNormal];
    [scrollView addSubview:qiqi];
}

- (void)initCloudImageV {
    cloudImageV = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH + 90, HEIGHT + 90, 60, 60)];
    cloudImageV.image = [UIImage imageNamed:@"筋斗云.jpg"];
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

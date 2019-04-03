//
//  GradientDisappears_ViewController.m
//  TEST
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "GradientDisappears_ViewController.h"
#import "Masonry.h"

#define kTopViewHeight 200.0
#define orignalRect CGRectMake(0, 0, self.tableView.frame.size.width, 2 * kTopViewHeight)

@interface GradientDisappears_ViewController () <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;//图片
@property (nonatomic, strong) UIView *backView;//背景视图

@property (nonatomic, strong) UIImageView *barImageView;

@end

@implementation GradientDisappears_ViewController

/**
- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}
- (void)viewWillDisappear:(BOOL)animated{
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}
**/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.title;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    _tableView.contentInset = UIEdgeInsetsMake(kTopViewHeight, 0, 0, 0);
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -kTopViewHeight, self.view.frame.size.width, kTopViewHeight)];
    _imageView.image = [UIImage imageNamed:@"2659589-b641ffa056d95adb"];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.layer.masksToBounds = YES;
    [self.tableView addSubview:_imageView];
    
    _barImageView = self.navigationController.navigationBar.subviews.firstObject;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"王大锤";
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    UIPanGestureRecognizer *pan = scrollView.panGestureRecognizer;
    CGFloat velocity = [pan velocityInView:scrollView].y;
    if (velocity < -8) {
        // 向上滑动
//        CGFloat minAlphaOffset = - 64;
//        CGFloat maxAlphaOffset = 200;
//        CGFloat offset = scrollView.contentOffset.y;
//        CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
//        _barImageView.alpha = alpha;
        
        

    } else if (velocity > 8) {
        // 向下滑动
        CGFloat y = scrollView.contentOffset.y;
        if (y > -kTopViewHeight) {
            self.navigationController.navigationBar.hidden = false;
        }
         
    } else if (velocity == 0) {

    }
    
    CGFloat y = scrollView.contentOffset.y;
    //实际上只是把图片的高度放大了
    if (y < -kTopViewHeight) {
        CGRect frame = _imageView.frame;
        frame.origin.y = y;
        frame.size.height =  -y;
        _imageView.frame = frame;
    }

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

//
//  CollectionViewCarouselView.m
//  TEST
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "CollectionViewCarouselView.h"
#import "Masonry.h"
#import "BannerCollectionCell.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ( [UIScreen mainScreen].bounds.size.height)

@interface CollectionViewCarouselView () <UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation CollectionViewCarouselView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self layoutCollectionView];
    }
    return self;
}

- (void)layoutCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(WIDTH, WIDTH / 2);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH / 2) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = UIColor.whiteColor;
    _collectionView.showsVerticalScrollIndicator = NO; // 滚动指示器
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.pagingEnabled = true;
    [_collectionView setContentOffset:CGPointMake(_collectionView.bounds.size.width, 0)];// 设置默认显示
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView registerClass:[BannerCollectionCell class] forCellWithReuseIdentifier:@"banner"];
    [self addSubview:_collectionView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    _pageControl.center = CGPointMake(0, WIDTH / 2 - 20);
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    [self addSubview:_pageControl];
    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(showNext) userInfo:nil repeats:true];
}

- (void)setAutomaticallyScrollDuration:(NSTimeInterval)automaticallyScrollDuration {
    _automaticallyScrollDuration = automaticallyScrollDuration;
    if (_automaticallyScrollDuration > 0) {
        [self.timer invalidate];
        self.timer = nil;
        NSTimer *timer = [NSTimer timerWithTimeInterval:self.automaticallyScrollDuration target:self selector:@selector(showNext) userInfo:nil repeats:true];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        self.timer = timer;
    } else {
        [self.timer invalidate];
    }
}

- (NSMutableArray *)mutableImageArray {
    if (self.dataArray.count > 0) {
        _mutableImageArray = [NSMutableArray arrayWithArray:self.dataArray];
        [_mutableImageArray addObject:self.dataArray.firstObject];// 把原数组的第一个数据插入到最后面生成一个新的数组
        [_mutableImageArray insertObject:[self.dataArray lastObject] atIndex:0];// 把原数组的最后一个数据插入到最前面生成一个新的数组
        _pageControl.numberOfPages = self.dataArray.count;
    }
    return _mutableImageArray;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.mutableImageArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BannerCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"banner" forIndexPath:indexPath];
    
    cell.bannerImageV.image = [UIImage imageNamed:self.mutableImageArray[indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"row = %ld",(long)indexPath.row);
    if ([self respondsToSelector:@selector(collectionView:didSelectItemAtIndexPath:)]) {
        [self.delegate clickCollectionItem:indexPath];
    }
}

#pragma mark - UIScrollViewDelegate实现
//手动拖拽结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self cycleScroll];
    //拖拽动作后间隔3s继续轮播
    [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:self.automaticallyScrollDuration]];
}

//自动轮播结束
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self cycleScroll];
}

//循环显示
- (void)cycleScroll {
    NSInteger page = _collectionView.contentOffset.x/_collectionView.bounds.size.width;
    if (page == 0) {//滚动到左边
        _collectionView.contentOffset = CGPointMake(_collectionView.bounds.size.width * (_mutableImageArray.count - 2), 0);
        _pageControl.currentPage = _mutableImageArray.count - 2;
    }else if (page == _mutableImageArray.count - 1){//滚动到右边
        _collectionView.contentOffset = CGPointMake(_collectionView.bounds.size.width, 0);
        _pageControl.currentPage = 0;
    }else{
        _pageControl.currentPage = page - 1;
    }
}

//自动显示下一个
- (void)showNext {
    //手指拖拽是禁止自动轮播
    if (_collectionView.isDragging) {return;}
    CGFloat targetX =  _collectionView.contentOffset.x + _collectionView.bounds.size.width;
    [_collectionView setContentOffset:CGPointMake(targetX, 0) animated:true];
}

- (void)dealloc {
    [_timer invalidate];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

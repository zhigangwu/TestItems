//
//  ZGPageMenu_ViewController.m
//  TEST
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "ZGPageMenu_ViewController.h"
#import "Masonry.h"
#import "ZGPageMenu_CollectionViewCell.h"

#import "PageMenuCollectionView.h"
#import "PageMenuScrollView.h"

#import "Spiderman_ViewController.h"
#import "IronMan_ViewController.h"
#import "Flash_ViewController.h"
#import "Superman_ViewController.h"
#import "Neptune_ViewController.h"
#import "WonderWoman_ViewController.h"
#import "Hulk_ViewController.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ( [UIScreen mainScreen].bounds.size.height)

@interface ZGPageMenu_ViewController () <UIScrollViewDelegate,ClickCollectionViewItemDelegate,ScrollViewContentOffsetDelegate>
{
    PageMenuCollectionView *pageMenuColl;
    PageMenuScrollView *pageMenuScr;
    
    
    NSMutableArray *selectedItemArray;
}

@property (nonatomic, assign) NSInteger selectedInteger;

@end

@implementation ZGPageMenu_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"PageMenu";
    self.view.backgroundColor = UIColor.whiteColor;
    
    selectedItemArray = [NSMutableArray array];
    
    pageMenuColl = [[PageMenuCollectionView alloc] init];
    pageMenuColl.delegate = self;
    pageMenuColl.integer = @2;
    [self.view addSubview:pageMenuColl];
    [pageMenuColl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
    [self setPageMenuScrollView:pageMenuColl.dataArray];
    [self scrollViewaddChildView:pageMenuScr.scrollView];
    [self scrollViewDefaultContentOffset:pageMenuColl.integer];
}

- (void)setPageMenuScrollView:(NSArray *)array {
    pageMenuScr = [[PageMenuScrollView alloc] init];
    pageMenuScr.delegate = self;
    pageMenuScr.scrollView.contentSize = CGSizeMake(array.count * WIDTH, HEIGHT - 118);
    [self.view addSubview:pageMenuScr];
    [pageMenuScr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->pageMenuColl.collectionView.mas_bottom).offset(10);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (void)scrollViewDefaultContentOffset:(NSNumber *)integer {
    [pageMenuScr.scrollView setContentOffset:CGPointMake(WIDTH * [integer intValue],0) animated:YES];
}

- (void)scrollViewaddChildView:(UIScrollView *)scrollView {
    Spiderman_ViewController *spiderman = [[Spiderman_ViewController alloc] init];
    spiderman.view.frame = CGRectMake(0, 0, WIDTH, HEIGHT - 118);
    [scrollView addSubview:spiderman.view];
    [self addChildViewController:spiderman];
    
    IronMan_ViewController *ironMan = [[IronMan_ViewController alloc] init];
    ironMan.view.frame = CGRectMake(WIDTH, 0, WIDTH, HEIGHT - 118);
    [scrollView addSubview:ironMan.view];
    [self addChildViewController:ironMan];

    Flash_ViewController *flash = [[Flash_ViewController alloc] init];
    flash.view.frame = CGRectMake(WIDTH * 2, 0, WIDTH, HEIGHT - 118);
    [scrollView addSubview:flash.view];
    [self addChildViewController:flash];

    Superman_ViewController *superman = [[Superman_ViewController alloc] init];
    superman.view.frame = CGRectMake(WIDTH * 3, 0, WIDTH, HEIGHT - 118);
    [scrollView addSubview:superman.view];
    [self addChildViewController:superman];

    Neptune_ViewController *neptune = [[Neptune_ViewController alloc] init];
    neptune.view.frame = CGRectMake(WIDTH * 4, 0, WIDTH, HEIGHT - 118);
    [scrollView addSubview:neptune.view];
    [self addChildViewController:neptune];

    WonderWoman_ViewController *wonderWoman = [[WonderWoman_ViewController alloc] init];
    wonderWoman.view.frame = CGRectMake(WIDTH * 5, 0, WIDTH, HEIGHT - 118);
    [scrollView addSubview:wonderWoman.view];
    [self addChildViewController:wonderWoman];

    Hulk_ViewController *hulk = [[Hulk_ViewController alloc] init];
    hulk.view.frame = CGRectMake(WIDTH * 6, 0, WIDTH, HEIGHT - 118);
    [scrollView addSubview:hulk.view];
    [self addChildViewController:hulk];

}

- (void)didClickCollectItem:(NSIndexPath *)indexPath {
    pageMenuScr.scrollView.contentOffset = CGPointMake(WIDTH * indexPath.row, 0);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGPoint targetOffset = [self nearestTargetOffsetForOffset:*targetContentOffset];
    targetContentOffset->x = targetOffset.x;
    targetContentOffset->y = targetOffset.y;
}

- (CGPoint)nearestTargetOffsetForOffset:(CGPoint)offset{
    CGFloat pageSize = (WIDTH / 2) + WIDTH * _selectedInteger;
    NSInteger page = roundf(offset.x / pageSize);
    CGFloat targetX = pageSize * page;
    return CGPointMake(targetX, offset.y);
}

- (void)contentOffset:(CGFloat)x {
    CGFloat index = x / WIDTH;

    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];    
    [self->pageMenuColl selectItemAtIndexPath:indexPath];
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

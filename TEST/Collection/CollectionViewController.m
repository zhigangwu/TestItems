//
//  CollectionViewController.m
//  TEST
//
//  Created by apple on 2019/2/27.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "CollectionViewController.h"
#import "Masonry.h"
#import "BannerCollectionCell.h"
#import "CollectionViewCarouselView.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ( [UIScreen mainScreen].bounds.size.height)

@interface CollectionViewController () <ClickCollectionItemDelegate>

@property (nonatomic, strong) CollectionViewCarouselView *carouselView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"collection";
    self.view.backgroundColor = UIColor.whiteColor;
    
    _carouselView = [[CollectionViewCarouselView alloc] init];
    _carouselView.delegate = self;
    [self.view addSubview:_carouselView];
    [_carouselView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(WIDTH / 2);
    }];

    NSArray *dataArray = @[@"背景2.jpeg",@"筋斗云.jpg",@"悟空.jpg",@"悟空小时候.jpg",@"孙悟饭爷爷.jpg"];
    _carouselView.dataArray = dataArray;
    _carouselView.automaticallyScrollDuration = 2;
}

- (void)clickCollectionItem:(NSIndexPath *)indexPath {
    NSLog(@"controlrow = %ld",(long)indexPath.row);
    if (indexPath.row == 0) {
        UIViewController *first = [[UIViewController alloc] init];
        first.view.backgroundColor = UIColor.redColor;
        [self.navigationController pushViewController:first animated:true];
    } else if (indexPath.row == 1) {
        UIViewController *second = [[UIViewController alloc] init];
        second.view.backgroundColor = UIColor.yellowColor;
        [self.navigationController pushViewController:second animated:true];
    } else if (indexPath.row == 2) {
        UIViewController *third = [[UIViewController alloc] init];
        third.view.backgroundColor = UIColor.yellowColor;
        [self.navigationController pushViewController:third animated:true];
    }
}


@end

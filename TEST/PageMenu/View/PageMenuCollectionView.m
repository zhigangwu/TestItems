//
//  PageMenuCollectionView.m
//  TEST
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "PageMenuCollectionView.h"
#import "Masonry.h"
#import "ZGPageMenu_CollectionViewCell.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ( [UIScreen mainScreen].bounds.size.height)

@interface PageMenuCollectionView () <UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
{
    NSMutableArray *selectArray;
}

@end

@implementation PageMenuCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _dataArray = @[@"蜘蛛侠",@"钢铁侠",@"闪电侠",@"超人",@"海王",@"神奇女侠",@"绿巨人"];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.itemSize = CGSizeMake(100, 44);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 44) collectionViewLayout:layout];
        _collectionView.backgroundColor = UIColor.whiteColor;
        _collectionView.layer.borderWidth = 0.5;
        _collectionView.layer.borderColor = UIColor.grayColor.CGColor;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ZGPageMenu_CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self addSubview:_collectionView];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ZGPageMenu_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.titleLab.text = _dataArray[indexPath.row];
    if ([_integer  isEqual: @(indexPath.row)]) {
        cell.titleLab.textColor = UIColor.redColor;
        cell.titleLab.font = [UIFont fontWithName:kBoldFont size:18];
        
    } else {
        cell.titleLab.textColor = UIColor.blackColor;
        cell.titleLab.font = [UIFont fontWithName:kNormalFont size:14];
    }
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _integer = @(indexPath.row);
    [_collectionView reloadData];
    
    if ([self respondsToSelector:@selector(collectionView:didSelectItemAtIndexPath:)]) {
        [self.delegate didClickCollectItem:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self respondsToSelector:@selector(collectionView:didSelectItemAtIndexPath:)]) {
        [self.delegate didClickCollectItem:indexPath];
    }
    
    _integer = @(indexPath.row);
    [_collectionView reloadData];
}

- (void)selectItemAtIndexPath:(nullable NSIndexPath *)indexPath {
    [_collectionView selectItemAtIndexPath:indexPath animated:true scrollPosition:UICollectionViewScrollPositionLeft];
    _integer = @(indexPath.row);
    [_collectionView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

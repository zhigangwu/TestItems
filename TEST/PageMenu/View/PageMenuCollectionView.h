//
//  PageMenuCollectionView.h
//  TEST
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ClickCollectionViewItemDelegate <NSObject>

- (void)didClickCollectItem:(NSIndexPath *)indexPath;

@end

@interface PageMenuCollectionView : UIView

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *dataArray;

@property (nonatomic, assign) NSNumber *integer;

@property (nonatomic, weak) id<ClickCollectionViewItemDelegate> delegate;

- (void)selectItemAtIndexPath:(nullable NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END

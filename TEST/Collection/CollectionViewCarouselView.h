//
//  CollectionViewCarouselView.h
//  TEST
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CollectionViewCarouselView;

@protocol ClickCollectionItemDelegate <NSObject>

@optional

- (void)clickCollectionItem:(NSIndexPath *)indexPath;

@end

@interface CollectionViewCarouselView : UIView

@property (nonatomic, assign) NSTimeInterval automaticallyScrollDuration; // 自动滚动间隔
@property (nonatomic, strong) NSTimer *timer; // 定时器
@property (nonatomic, copy) NSArray *dataArray; // 图片数据
@property (nonatomic, strong) NSMutableArray *mutableImageArray; // 循环图片数组

@property (nonatomic, weak) id<ClickCollectionItemDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

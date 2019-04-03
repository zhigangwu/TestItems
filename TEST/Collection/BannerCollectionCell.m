//
//  BannerCollectionCell.m
//  TEST
//
//  Created by apple on 2019/3/1.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "BannerCollectionCell.h"
#import "Masonry.h"

@implementation BannerCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _bannerImageV = [UIImageView new];
        [_bannerImageV.layer setCornerRadius:5];
        _bannerImageV.layer.masksToBounds = true;
        [self.contentView addSubview:_bannerImageV];
        [_bannerImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self.contentView);
        }];
    }
    
    return self;
}

@end

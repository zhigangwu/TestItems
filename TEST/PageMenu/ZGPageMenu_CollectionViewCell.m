//
//  ZGPageMenu_CollectionViewCell.m
//  TEST
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "ZGPageMenu_CollectionViewCell.h"
#import "Masonry.h"

@implementation ZGPageMenu_CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _titleLab = [UILabel new];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self);
            make.left.right.equalTo(self);
        }];
    }
    return self;
}

@end

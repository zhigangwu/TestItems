//
//  Header.h
//  TEST
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "PPNetworkHelper.h"
#import "Masonry.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ( [UIScreen mainScreen].bounds.size.height)

#define URL(str) [NSString stringWithFormat:@"http://api.rakecn.cn:13399/hongsipu-api/%@??key=z1zkey&code=MTJCNDgyOTIxOTk4QjUzQzM2QTlFN0ZFMzY0MDNEMjQ=&requestCode=-1",str]

//常规体
#define kNormalFont @"PingFangSC-Regular"
//中黑体
#define kBoldFont @"PingFangSC-Medium"

#endif /* Header_h */

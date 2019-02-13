//
//  Snapshot.h
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/23.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Snapshot : NSObject

/**
 整个页面的截图
 图片jpeg压缩0.9和1区别极大，将近压缩一半；但是0.9以下区别并不大，0.1比0.9的大小也就少一半多点而已
 视觉效果来看，0.6以上就差不太多了
 【以上数据只对此特定内容的image有效】
 */
+ (void)snapshot;

@end

NS_ASSUME_NONNULL_END

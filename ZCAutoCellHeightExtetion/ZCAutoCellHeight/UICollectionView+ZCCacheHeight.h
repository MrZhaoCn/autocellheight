//
//  UICollectionView+ZCCacheHeight.h
//
//  Created by MrZhao on 16/5/19.
//  Copyright © 2016年 MrZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (ZCCacheHeight)
/*
 *理论上该字典只会有一个cell
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *zc_reuseCells;
@end

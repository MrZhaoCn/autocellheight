//
//  UICollectionView+ZCCacheHeight.m
//
//  Created by MrZhao on 16/5/19.
//  Copyright © 2016年 MrZhao. All rights reserved.
//

#import "UICollectionView+ZCCacheHeight.h"
#import <objc/runtime.h>
static const void *zc_collection_reuse_cells_key = "zc_collection_reuse_cells_key";

@implementation UICollectionView (ZCCacheHeight)
- (NSMutableDictionary *)zc_reuseCells {
    
    NSMutableDictionary *reuseCells = objc_getAssociatedObject(self, zc_collection_reuse_cells_key);
    if (reuseCells == nil) {
        
        reuseCells = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, zc_collection_reuse_cells_key, reuseCells, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return reuseCells;
}
@end

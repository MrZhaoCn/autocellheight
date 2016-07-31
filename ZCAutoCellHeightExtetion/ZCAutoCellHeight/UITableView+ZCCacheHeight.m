//
//  UITableView+ZCCacheHeight.m
//
//  Created by MrZhao on 16/5/17.
//  Copyright © 2016年 MrZhao. All rights reserved.
//

#import "UITableView+ZCCacheHeight.h"
#import <objc/runtime.h>
static const void *zc_tableview_reuse_cells_key = "zc_tableview_reuse_cells_key";

@implementation UITableView (ZCCacheHeight)

- (NSMutableDictionary *)zc_reuseCells {
    
    NSMutableDictionary *reuseCells = objc_getAssociatedObject(self, zc_tableview_reuse_cells_key);
    
    if (reuseCells == nil) {
        
        reuseCells = [[NSMutableDictionary alloc] init];
        
       objc_setAssociatedObject(self, zc_tableview_reuse_cells_key, reuseCells, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return reuseCells;
}
@end

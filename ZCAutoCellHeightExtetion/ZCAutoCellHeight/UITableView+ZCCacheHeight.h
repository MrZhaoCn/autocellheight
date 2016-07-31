//
//  UITableView+ZCCacheHeight.h
//
//  Created by MrZhao on 16/5/17.
//  Copyright © 2016年 MrZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ZCCacheHeight)
/*
 *理论上该字典只会有一个cell
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *zc_reuseCells;
@end

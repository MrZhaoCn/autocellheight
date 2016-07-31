//
//  UITableViewCell+ZCAutoCellHeight.m
//
//  Created by MrZhao on 16/5/17.
//  Copyright © 2016年 MrZhao. All rights reserved.
//

#import "UITableViewCell+ZCAutoCellHeight.h"
#import <objc/runtime.h>
#import "UITableView+ZCCacheHeight.h"

const void *zc_lastViewInTableViewCellKey = @"zc_lastViewInTableViewCellKey";
const void *zc_bottomOffSetToTableViewCellKey = @"zc_bottomOffSetToTableViewCellKey";

@implementation UITableViewCell (ZCMasonryAutoCellHeight)
/*
 *cell最后一个View的setter方法
 */
- (void)setZc_LastViewInCell:(UIView *)zc_LastViewInCell {
    
    objc_setAssociatedObject(self, zc_lastViewInTableViewCellKey, zc_LastViewInCell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/*
 *cell最后一个View的getter方法
 */
- (UIView *)zc_LastViewInCell {
    
    return objc_getAssociatedObject(self, zc_lastViewInTableViewCellKey);
}

/*
 *cell最后一个View的距离底部的偏移量setter方法
 */
- (void)setZc_bottomOffSetToCell:(CGFloat)zc_bottomOffSetToCell {
    
    objc_setAssociatedObject(self, zc_bottomOffSetToTableViewCellKey, @(zc_bottomOffSetToCell), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/*
 *cell最后一个View的距离底部的偏移量getter方法
 */
- (CGFloat)zc_bottomOffSetToCell {
    
    NSNumber *number = objc_getAssociatedObject(self, zc_bottomOffSetToTableViewCellKey);
    if ([number respondsToSelector:@selector(floatValue)]) {
        return number.floatValue;
    }
    return 0.0;
}
/*
 *返回cell的高度
 */
+ (CGFloat)cellHeightForTableView:(UITableView *)tableView config:(cellBlock)config {
    
    UITableViewCell *cell = [tableView.zc_reuseCells objectForKey:[[self class] description]];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault
                           reuseIdentifier:nil];
        [tableView.zc_reuseCells setObject:cell forKey:[[self class] description]];
    }
    if (config) {
        config(cell);
    }
   
    return [cell private_cellHeight];
}

- (CGFloat)private_cellHeight{
    
     NSAssert(self.zc_LastViewInCell != nil, @"您未指定cell排列中最后一个视图对象，无法计算cell的高度");
    
    [self layoutIfNeeded];//这句话一定要加上
    
    CGFloat height = self.zc_LastViewInCell.frame.size.height + self.zc_LastViewInCell.frame.origin.y + self.zc_bottomOffSetToCell;
    return height;
    
}
@end
